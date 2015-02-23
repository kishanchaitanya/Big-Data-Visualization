shinyUI(navbarPage("INPATIENT PROSPECTIVE PAYMENT SYSTEM",
                   tabPanel("Choropleth Maps",
                            titlePanel("Medical Expenditure Across States"),
                            sidebarLayout(
                              sidebarPanel(
                                
                                radioButtons("radio1", label = h3("Select Type"),
                                             choices = list("Average Covered Charges" = "Average Covered Charges", "Average Total Payments" = "Average Total Payments", "Average Medicare Payments" = "Average Medicare Payments"), 
                                             selected = "Average Medicare Payments"),
                                
                                selectInput("selectDRG", label = h3("Select DRG Definition"), 
                                  choices = list("039 - EXTRACRANIAL PROCEDURES W/O CC/MCC"="039 - EXTRACRANIAL PROCEDURES W/O CC/MCC",
                                                 "057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC"="057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC",
                                                 "064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC"="064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC",
                                                 "065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC"="065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC",
                                                 "066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"="066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"),
                                  selected = "039 - EXTRACRANIAL PROCEDURES W/O CC/MCC")
                                
                              ),
                              mainPanel(
                                plotOutput("plot"),
                                br(),
                                br(),
                                
                                
                                textOutput("MapInfo")
                              )
                            )
                   ),
                   
                   tabPanel("Bar Plots",
                            titlePanel("Medical Expenditure Across States"),
                            sidebarLayout(position="left",
                              sidebarPanel(
                                
                                radioButtons("radio2", label = h3("Select Type"),
                                             choices = list("Average Covered Charges" = "Average Covered Charges", "Average Total Payments" = "Average Total Payments", "Average Medicare Payments" = "Average Medicare Payments"), 
                                             selected = "Average Medicare Payments"),
                                
                                selectInput("selectDRG2", label = h3("Select DRG Definition"), 
                                            choices = list("039 - EXTRACRANIAL PROCEDURES W/O CC/MCC"="039 - EXTRACRANIAL PROCEDURES W/O CC/MCC",
                                                           "057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC"="057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC",
                                                           "064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC"="064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC",
                                                           "065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC"="065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC",
                                                           "066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"="066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"),
                                            selected = "039 - EXTRACRANIAL PROCEDURES W/O CC/MCC")
                                
                              ),
                              mainPanel(
                                plotOutput("BarPlot"),
                                br(),
                                br(),
                                
                                
                                textOutput("BarPlotInfo")
                              )
                            )
                   ),
                   tabPanel("Pie Charts",
                            titlePanel("Discharge Rate Across States"),
                            sidebarLayout(position="left",
                                          sidebarPanel(
                                            
                                            selectInput("selectDRG3", label = h3("Select DRG Definition"), 
                                                        choices = list("039 - EXTRACRANIAL PROCEDURES W/O CC/MCC"="039 - EXTRACRANIAL PROCEDURES W/O CC/MCC",
                                                                       "057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC"="057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC",
                                                                       "064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC"="064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC",
                                                                       "065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC"="065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC",
                                                                       "066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"="066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"),
                                                        selected = "039 - EXTRACRANIAL PROCEDURES W/O CC/MCC")
                                            
                                          ),
                                          mainPanel(
                                            plotOutput("PieChart"),
                                            plotOutput("PieChart2"),
                                            
                                            textOutput("PieChartInfo")
                                          )
                            )
                   ),
                   
                   tabPanel("Plot",
                            titlePanel("Discharge Rate Across States"),
                            sidebarLayout(position="left",
                                          sidebarPanel(
                                            
                                            selectInput("selectDRG6", label = h3("Select DRG Definition"), 
                                                        choices = list("039 - EXTRACRANIAL PROCEDURES W/O CC/MCC"="039 - EXTRACRANIAL PROCEDURES W/O CC/MCC",
                                                                       "057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC"="057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC",
                                                                       "064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC"="064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC",
                                                                       "065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC"="065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC",
                                                                       "066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"="066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"),
                                                        selected = "039 - EXTRACRANIAL PROCEDURES W/O CC/MCC")
                                            
                                          ),
                                          mainPanel(
                                            plotOutput("boxPlot"),
                                            br(),
                                            br(),
                                            
                                            
                                            textOutput("BoxPlotInfo")
                                          )
                            )
                   ),
                   
                   tabPanel("Word Cloud",
                            titlePanel("Hospital Distribution Across States"),
                            sidebarLayout(position="left",
                                          sidebarPanel(
                                            
                                            selectInput("selectDRG4", label = h3("Select DRG Definition"), 
                                                        choices = list("039 - EXTRACRANIAL PROCEDURES W/O CC/MCC"="039 - EXTRACRANIAL PROCEDURES W/O CC/MCC",
                                                                       "057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC"="057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC",
                                                                       "064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC"="064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC",
                                                                       "065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC"="065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC",
                                                                       "066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"="066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"),
                                                        selected = "039 - EXTRACRANIAL PROCEDURES W/O CC/MCC")
                                            
                                          ),
                                          mainPanel(
                                            plotOutput("wordcloud"),
                                            br(),
                                            br(),
                                            
                                            
                                            textOutput("WordcloudInfo")
                                          )
                            )
                   ),
                   tabPanel("Line Plot",
                            titlePanel("Hospital Distribution Across States"),
                            sidebarLayout(position="left",
                                          sidebarPanel(
                                            
                                            selectInput("selectDRG5", label = h3("Select DRG Definition"), 
                                                        choices = list("039 - EXTRACRANIAL PROCEDURES W/O CC/MCC"="039 - EXTRACRANIAL PROCEDURES W/O CC/MCC",
                                                                       "057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC"="057 - DEGENERATIVE NERVOUS SYSTEM DISORDERS W/O MCC",
                                                                       "064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC"="064 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W MCC",
                                                                       "065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC"="065 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W CC",
                                                                       "066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"="066 - INTRACRANIAL HEMORRHAGE OR CEREBRAL INFARCTION W/O CC/MCC"),
                                                        selected = "039 - EXTRACRANIAL PROCEDURES W/O CC/MCC")
                                            
                                          ),
                                          mainPanel(
                                            plotOutput("linePlot"),
                                            br(),
                                            br(),
                                            
                                            
                                            textOutput("LinePlotInfo")
                                          )
                            )
                   )
                   
                   #tabPanel("XYZ")
))