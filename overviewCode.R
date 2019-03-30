pipeline <- read.csv("pipelineAnalytics.csv")
head(pipeline)


dim(pipeline)

library(ggplot2)
theme_set(theme_linedraw())
options(scipen = 999)

w <- ggplot(pipeline, aes(Route.To.Market))
w + geom_bar(width = 0.6, fill = "coral") +
  labs(title = "Number of Opps By Sales Channel",
    subtitle = "Route to Market",
    caption = "Source: IBM Watson Win Loss Analysis dataset",
    y = "Number of Opps",
    x = "Sales Channel") +
  theme(axis.text.x = element_text(angle = 65, vjust = 0.6))

table(pipeline$Route.To.Market)

w1 <- ggplot(pipeline, aes(x = Route.To.Market, y = Opportunity.Amount.USD))
w1 + geom_bar(stat = "identity", width = 0.6, fill = "coral") +
  labs(title = "Total Opportunity $ By Sales Channel",
    subtitle = "Route to Market",
    caption = "Source: IBM Watson Win Loss Analysis dataset",
    y = "USD",
    x = "Sales Channel") +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.text.x = element_text(angle = 65, vjust = 0.6))

tapply(pipeline$Opportunity.Amount.USD, pipeline$Route.To.Market, FUN = sum)

rtmTBL <- table(pipeline$Route.To.Market, pipeline$Client.Size.By.Revenue)
rtmTBL

prop.table(rtmTBL, 1)

cltTBL <- table(pipeline$Route.To.Market, pipeline$Revenue.From.Client.Past.Two.Years)
cltTBL

prop.table(cltTBL, 1)

oppTBL <- table(pipeline$Route.To.Market, pipeline$Deal.Size.Category)
oppTBL

prop.table(oppTBL, 1)

