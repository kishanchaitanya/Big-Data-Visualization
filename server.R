library(RColorBrewer)
library(wordcloud)
library(choroplethr)

#oldstates<-c("alaska","alabama","arkansas","arizona","california","colorado","connecticut","delaware","florida","georgia","hawaii","iowa","idaho","illinois","indiana","kansas","kentucky","louisiana","massachusetts","maryland","maine","michigan","minnesota","missouri","mississippi","montana","north carolina","north dakota","nebraska","new hampshire","new jersey","new mexico","nevada","new york","ohio","oklahoma","oregon","pennsylvania","rhode island","south carolina","south dakota","tennessee","texas","utah","virginia","vermont","washington","wisconsin","west virginia","wyoming")
states<-c("alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "north dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode island", "south carolina", "south dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming")

DB<-read.csv(file="IPPS.csv")
statesShort<-unique(DB$Provider.State)
statesShort<-statesShort[-9]
#DRG<-unique(DB$DRG.Definition)
#divisor<-NULL

shinyServer(function(input, output) {
  
  output$plot <- renderPlot({
    
    DRGDefn<-input$selectDRG
    Type<-input$radio1
    output$MapInfo <- renderText({ 
      paste("Expenditure Across States of ", Type, "for ", DRGDefn)
    })
    
    divisor<-NULL
    if(Type=="Average Covered Charges"){
      sum_pay=aggregate(DB$Average.Covered.Charges,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    }
    else if(Type=="Average Total Payments"){
      sum_pay=aggregate(DB$Average.Total.Payments,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    }
    else if(Type=="Average Medicare Payments"){
      sum_pay=aggregate(DB$Average.Medicare.Payments,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    }
    
    x<-subset(DB,DB$DRG.Definition==DRGDefn)
    for(i in 1:50){
      y<-subset(x,x$Provider.State==statesShort[i])
      divisor[i]<-length(y$Provider.Name)
    }
    
    
    constCategory<-subset(sum_pay,sum_pay[,2]==DRGDefn)
    values<-constCategory$x[-9]
    values<-values/divisor
    df<-data.frame(region=states,value=values)
    
    
    state_choropleth(df)
  })
  
  output$BarPlot <- renderPlot({
    
    DRGDefn<-input$selectDRG2
    Type<-input$radio2
    output$BarPlotInfo <- renderText({ 
      paste("Expenditure Across States of ", Type, "for ", DRGDefn)
    })
    
    divisor<-NULL
    if(Type=="Average Covered Charges"){
      sum_pay=aggregate(DB$Average.Covered.Charges,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    }
    else if(Type=="Average Total Payments"){
      sum_pay=aggregate(DB$Average.Total.Payments,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    }
    else if(Type=="Average Medicare Payments"){
      sum_pay=aggregate(DB$Average.Medicare.Payments,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    }
    
    x<-subset(DB,DB$DRG.Definition==DRGDefn)
    for(i in 1:50){
      y<-subset(x,x$Provider.State==statesShort[i])
      divisor[i]<-length(y$Provider.Name)
    }
    
    constCategory<-subset(sum_pay,sum_pay[,2]==DRGDefn)
    values<-constCategory$x[-9]
    values<-values/divisor
    df<-cbind(statesShort,values)
    row.names(df)<-statesShort
    
    barplot(df[,2],
            col="orange",
            main=DRGDefn,
            ylab="Average Value Per State",
            xlab="States")
    
  })
  
  output$PieChart <- renderPlot({
    
    DRGDefn<-input$selectDRG3

    output$PieChartInfo <- renderText({ 
      paste("Discharge Rates for ", DRGDefn)
    })
    
    sum_pay=aggregate(DB$Total.Discharges,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    constCategory<-subset(sum_pay,sum_pay[,2]==DRGDefn)
    values<-constCategory$x[-9]
    
    pie(values[1:25], statesShort[1:25], 
        main="Discharge Rates"
        #col=rainbow(length(statesShort))
        )
    
  })
  
  output$PieChart2 <- renderPlot({
    
    DRGDefn<-input$selectDRG3
    
    sum_pay=aggregate(DB$Total.Discharges,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    constCategory<-subset(sum_pay,sum_pay[,2]==DRGDefn)
    values<-constCategory$x[-9]
    
    pie(values[25:50], statesShort[25:50]
        #main="Pie Chart"
        #col=rainbow(length(statesShort))
    )
    
  })
  
  output$boxPlot <- renderPlot({
    
    DRGDefn<-input$selectDRG6
    
    output$BoxPlotInfo <- renderText({ 
      paste("Discharge Rates for ", DRGDefn)
    })
    
    #divisor<-NULL
    #x<-subset(DB,DB$DRG.Definition==DRGDefn)
    #for(i in 1:50){
      #y<-subset(x,x$Provider.State==statesShort[i])
      #divisor[i]<-length(y$Provider.Id)
    #}
    
    sum_pay=aggregate(DB$Total.Discharges,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    constCategory<-subset(sum_pay,sum_pay[,2]==DRGDefn)
    values<-constCategory$x[-9]
    
    df=data.frame(statesShort,values)
    row.names(df)<-statesShort
    
    plot(
      df[,2],
      axes=FALSE,
      xlab="STATES",
      ylab="TOTAL NUMBER OF DISCHARGES"
    )
    axis(1,at=1:50,lab=statesShort)
    axis(2)
    
  })
  
  output$wordcloud <- renderPlot({
    
    DRGDefn<-input$selectDRG4
    
    output$WordcloudInfo <- renderText({ 
      paste("Hospital Distribution Across States for ", DRGDefn)
    })
    
    #sum_pay=aggregate(DB$Total.Discharges,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    #constCategory<-subset(sum_pay,sum_pay[,2]==DRGDefn)
    #values<-constCategory$x[-9]
    
    divisor<-NULL
    x<-subset(DB,DB$DRG.Definition==DRGDefn)
    for(i in 1:50){
      y<-subset(x,x$Provider.State==statesShort[i])
      divisor[i]<-length(y$Provider.Id)
    }
    
    df=data.frame(statesShort,divisor)
    row.names(df)<-statesShort
    
    
    wordcloud(
      states,
      divisor,
      colors=brewer.pal(8,"Dark2"))
    
  })
  
  output$linePlot <- renderPlot({
    
    DRGDefn<-input$selectDRG5
    
    output$LinePlotInfo <- renderText({ 
      paste("Hospital Distribution Across States for ", DRGDefn)
    })
    
    #sum_pay=aggregate(DB$Total.Discharges,by=list(DB$Provider.State,DB$DRG.Definition),FUN=sum)
    #constCategory<-subset(sum_pay,sum_pay[,2]==DRGDefn)
    #values<-constCategory$x[-9]
    #df=data.frame(statesShort,values)
    #row.names(df)<-statesShort
    
    divisor<-NULL
    x<-subset(DB,DB$DRG.Definition==DRGDefn)
    for(i in 1:50){
      y<-subset(x,x$Provider.State==statesShort[i])
      divisor[i]<-length(y$Provider.Id)
    }
    
    df=data.frame(statesShort,divisor)
    row.names(df)<-statesShort
    
    plot(
      df[,2],
      type="o", 
      col="red",
      axes=FALSE,
      xlab="STATES",
      ylab="TOTAL NUMBER OF HOSPITALS"
    )
    axis(1,at=1:50,lab=statesShort)
    axis(2)
    
  })
  
})