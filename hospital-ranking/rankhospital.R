rankhospital <- function(state, outcome, num){
    
    state_table <- outcome_table[outcome_table$State == state,]
    
    if(!any(outcome_table$State == state)){
        stop("invalid state")
    }
    
    if(!any(outcome == "heart attack" | outcome =="heart failure" | outcome == "pneumonia")){
        stop("invalid outcome")
    }
    
    
    if(num == "best"){num = 1}
    
    
    if(outcome == "heart attack"){
        outcomes_table <- state_table[,c(2,11)]
        outcomes_table <- outcomes_table[!(outcomes_table[,2] == "Not Available"),]
        outcomes_table[,2] <- as.numeric(outcomes_table[,2])
        ordered_data <- outcomes_table[order(outcomes_table[,2], outcomes_table[,1], decreasing = FALSE),]
        if(num == "worst"){num = nrow(ordered_data)}
        if(num > nrow(ordered_data)){return(NA)}
        return(ordered_data[num,1])
    }
    
    if(outcome == "heart failure"){
        outcomes_table <- state_table[,c(2,17)]
        outcomes_table <- outcomes_table[!(outcomes_table[,2] == "Not Available"),]
        outcomes_table[,2] <- as.numeric(outcomes_table[,2])
        ordered_data <- outcomes_table[order(outcomes_table[,2], outcomes_table[,1], decreasing = FALSE),]
        if(num == "worst"){num = nrow(ordered_data)}
        if(num > nrow(ordered_data)){return(NA)}
        return(ordered_data[num,1])
    }
    
    if(outcome == "pneumonia"){
        outcomes_table <- state_table[,c(2,23)]
        outcomes_table <- outcomes_table[!(outcomes_table[,2] == "Not Available"),]
        outcomes_table[,2] <- as.numeric(outcomes_table[,2])
        ordered_data <- outcomes_table[order(outcomes_table[,2], outcomes_table[,1], decreasing = FALSE),]
        if(num == "worst"){num = nrow(ordered_data)}
        if(num > nrow(ordered_data)){return(NA)}
        return(ordered_data[num,1])
    }
    
}