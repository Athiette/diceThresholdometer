library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Dice Thresholdometer"),
  sidebarPanel(
    h3('Settings'),
    numericInput('inD6', 'Number of six-sided dice to roll', 1, min = 1, max = 40, step = 1),
    numericInput('inSuccess', 'Number of successes required', 1, min = 1, max = 40, step = 1),
    radioButtons("iType", "What value is a success?",
                       c("4 + is a Success" = "4s",
                         "5 + is a Success" = "5s",
                         "Success only on a 6" = "6s")),
    submitButton('Calculate')
    
  ),
  mainPanel(
    h3('Instructions'),
    "In the panel to the left, set how many dice are being rolled, and how many successes are required. 
    Then set whether a success is achieved on a 4+, 5+, or 6. After you've done this, hit the Calculate button.",
    "In the boxes below you can then see the probability of rolling at least that many successes.",
    h3('Chance for Success'),
    'The probability of reaching',
    verbatimTextOutput("onSuccess"),
    'successes with',
    verbatimTextOutput("onD6"),
    'six-sided dice is ',
    verbatimTextOutput("oProb")
  )
))