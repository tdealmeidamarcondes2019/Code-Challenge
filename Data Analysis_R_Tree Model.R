## Preparing data ####
# Importing necessary packages:
library(rpart)
# Reading the csv file:
week_log <- read.csv("weekly_logins_edited.csv")
# PS: Using edited file after preparing it in Python

## Building Tree Model ####
# Tree model with all variables:
mytree <- rpart(user_success ~ week_log$free_trial + week_log$slack_integration +
                  week_log$sales_call + week_log$zendesk + week_log$salesforce + 
                  week_log$gmail + week_log$touch_close + week_log$admin_panel +
                  week_log$support_request + week_log$One.Legal + 
                  week_log$user_mrr + week_log$X.dashboard + 
                  week_log$X.home + week_log$X.login +
                  week_log$X.tool.build_query + week_log$X.tool.search +
                  week_log$X.tool.storyboard + week_log$HP + 
                  week_log$Huron.Consulting.Group + week_log$Hushmail +
                  week_log$InVision + week_log$LiveRamp + 
                  week_log$Lucky.Brand + week_log$Lush + week_log$One.Legal +
                  week_log$Siemon + week_log$SpaceX + week_log$Stupp.Bros +
                  week_log$TaxSlayer..LLC + week_log$Twilio + 
                  week_log$US.Soccer.Federation + 
                  week_log$Uniform.Law.Commission + week_log$Veritext +
                  week_log$Visa + week_log$Wal.Mart.Stores + 
                  week_log$Whitesell.Corporation + 
                  week_log$Worldsource.Wealth.Management + 
                  week_log$Yahoo..Inc. + week_log$Zendesk + 
                  week_log$Zoom.Video.Communications + 
                  week_log$Consumer.Products + week_log$Finance +
                  week_log$Hospitality + week_log$Legal.Services +
                  week_log$Manufacturing + week_log$Other + 
                  week_log$Professional.Services + week_log$Technology +
                  week_log$X.100M....500M + week_log$X.1B....10B +
                  week_log$X.500M....1B + week_log$X..100M + 
                  week_log$X..10B + week_log$East + week_log$Midwest +
                  week_log$West + week_log$X.facebook.com + 
                  week_log$X.google.com + week_log$X.mail.google.com +
                  week_log$X.quora + week_log$X.slack.com +
                  week_log$X.tripadvisor.com + week_log$hotels.com +
                  week_log$zoom.com, 
                data = week_log, method = "class", cp=0.0038)
# Plotting to check the best tree size to visualize it:
plotcp(mytree) 
  # we can see that cp = 0.0038 will give us a tree size of 5, which will be
  # better to visualize than 2.

# Plotting tree:
rpart.plot::rpart.plot(mytree, type = 1, extra=1, 
                       box.palette =c("pink", "green"), branch.lty=3, 
                       shadow.col = "gray")

# Using the tree based-model, it is possible to visualize that the most
# relevant variable is "Had Free Trial", in the same way we saw with the
# correlation. 

# However, diferently from the correlation, after that, the most significant
# variables were users that visited more the pages "/tool/dashboard" (negatively),
# and "/tool/build_query" (positively), i.e., users that the page they visited
# more were the dashboard tend to be less engaged, and users that visited more
# the page to build queries tend to be more engaged. 

# Lastly, users that required more than 10 sales touches to close also tend
# to be more engaged.

