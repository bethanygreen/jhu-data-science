rankall <- function(outcome, num = "best"){
    
    states <- unique(factor(outcome_table$State))
    
    
    if(!any(outcome == "heart attack" | outcome =="heart failure" | outcome == "pneumonia")){
        stop("invalid outcome")
    }
    
    
    if(num == "best"){num = 1}
    
    if(outcome == "heart attack"){
        hosp_df <- data.frame()
        for(state in levels(states)){
            state_table <- outcome_table[outcome_table$State == state,]
            outcomes_table <- state_table[,c(2,7,11)]
            outcomes_table <- outcomes_table[!(outcomes_table[,3] == "Not Available"),]
            outcomes_table[,3] <- as.numeric(outcomes_table[,3])
            ordered_data <- outcomes_table[order(outcomes_table[,3], outcomes_table[,1], decreasing = FALSE),]
            if(num == "worst"){new_num = nrow(ordered_data)
            hosp_list <- c(ordered_data[new_num,1], state)
            hosp_df <- rbind(hosp_df, hosp_list)
            }
            else{
                hosp_list <- c(ordered_data[num,1], state)
                hosp_df <- rbind(hosp_df, hosp_list)
                }
        }
        colnames(hosp_df) <- c("hospital", "state")
        return(hosp_df)
    }
    
    if(outcome == "heart failure"){
        hosp_df <- data.frame()
        for(state in levels(states)){
            state_table <- outcome_table[outcome_table$State == state,]
            outcomes_table <- state_table[,c(2,7,17)]
            outcomes_table <- outcomes_table[!(outcomes_table[,3] == "Not Available"),]
            outcomes_table[,3] <- as.numeric(outcomes_table[,3])
            ordered_data <- outcomes_table[order(outcomes_table[,3], outcomes_table[,1], decreasing = FALSE),]
            if(num == "worst"){new_num = nrow(ordered_data)
            hosp_list <- c(ordered_data[new_num,1], state)
            hosp_df <- rbind(hosp_df, hosp_list)
            }
            else{
                hosp_list <- c(ordered_data[num,1], state)
                hosp_df <- rbind(hosp_df, hosp_list)
                }
        }
        colnames(hosp_df) <- c("hospital", "state")
        return(hosp_df)
    }
    
    if(outcome == "pneumonia"){
        hosp_df <- data.frame()
        for(state in levels(states)){
            state_table <- outcome_table[outcome_table$State == state,]
            outcomes_table <- state_table[,c(2,7,23)]
            outcomes_table <- outcomes_table[!(outcomes_table[,3] == "Not Available"),]
            outcomes_table[,3] <- as.numeric(outcomes_table[,3])
            ordered_data <- outcomes_table[order(outcomes_table[,3], outcomes_table[,1], decreasing = FALSE),]
            if(num == "worst"){new_num = nrow(ordered_data)
                hosp_list <- c(ordered_data[new_num,1], state)
                hosp_df <- rbind(hosp_df, hosp_list)
            }
            else{
                hosp_list <- c(ordered_data[num,1], state)
                hosp_df <- rbind(hosp_df, hosp_list)
                }
        }
        colnames(hosp_df) <- c("hospital", "state")
        return(hosp_df)
    }
    
    
}