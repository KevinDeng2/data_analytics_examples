library(shiny)


ui = fluidPage(
    titlePanel("Motor Trends Miles Per Gallon Data"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Select Number of Bins:",
                        min = 5,
                        max = 40,
                        value = 30),
            selectInput('color',
                        "Select a Color:",
                        c('Light Blue' = 'lightblue',
                          'Light Green' = 'lightgreen',
                          'Lavender' = 'lavender',
                          'Pink' = 'pink'))
            ),
        mainPanel(plotOutput("plot"))
        ),
        
)

server = function(input, output) {
    output$plot = renderPlot({
        x = mtcars$mpg
        bins = seq(min(x), max(x), length.out = input$bins + 1)
        hist(x, bins, col = input$color, main = 'Histogram of MPG', xlab = 'MPG')
    })
}
shinyApp(ui = ui, server = server)
