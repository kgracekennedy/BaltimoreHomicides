agecount <- function(age = NULL) { 
  ## Check that "age" is non-NULL; else throw error

## Read "homicides.txt" data file
  homicides=readLines("homicides.txt")
## Extract ages of victims; ignore records where no age is given
  #male. nono years, Age
  r <- regexec("(Age:|male,) +(.*?) years", homicides)
  ages=regmatches(homicides,r)
  ages=as.matrix(ages)
  allages=sapply(ages, function (x) x[3])
  
## Return integer containing count of homicides for that age
  allages=as.numeric(allages)
  well=length(grep(age,allages))
  return(well)
}