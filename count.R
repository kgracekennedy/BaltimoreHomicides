count <- function(cause = NULL) { 
  ## Check that "cause" is non-NULL; else throw error 
  #print(length(cause))
  if(length(cause)==0){
    stop("No Cause of Death Specified.")
  }
  ## Check that specific "cause" is allowed; else throw error
  allowed=grep("[uU][nN][kK][nN][oO][wW][nN]|[sS][tT][aA][bB][bB][iI][nN][gG]|[sS][hH][oO][oO][tT][iI][nN][gG]|[oO][tT][hH][eE][rR]|[bB][lL][uU][nN][tT] [fF][oO][rR][cC][eE]|[aA][sS][pP][hH][yY][xX][iI][aA][tT][iI][oO][nN]",cause)
  #print(allowed)
  if(length(allowed)==0){
    stop("This cause is not allowed.  Please choose from “asphyxiation”, “blunt force”, “other”, “shooting”, “stabbing”, “unknown”.")
  }
  #This is problematic because it doesn't throw an error of there is extra stuff...
  #print(cause)
  
  ## Read "homicides.txt" data file 
  homicides=readLines("homicides.txt")
  
  ## Extract causes of death 
  r <- regexec("<dd>[Cc]ause: (.*?)</dd>", homicides)
  causes=regmatches(homicides,r)
  allcauses=sapply(causes, function (x) x[2])

  ## Return integer containing count of homicides for that cause
  a=grep("[aA][sS][pP][hH][yY][xX][iI][aA][tT][iI][oO][nN]",cause)
  bf=grep("[bB][lL][uU][nN][tT] [fF][oO][rR][cC][eE]",cause)
  sh=grep("[sS][hH][oO][oO][tT][iI][nN][gG]",cause)
  st=grep("[sS][tT][aA][bB][bB][iI][nN][gG]",cause)
  o=grep("[oO][tT][hH][eE][rR]",cause)
  u=grep("[uU][nN][kK][nN][oO][wW][nN]",cause)
  
  if(length(a)>0){
    n=length(grep("[aA][sS][pP][hH][yY][xX][iI][aA][tT][iI][oO][nN]",allcauses))
  } else if(length(bf)>0){
    n=length(grep("[bB][lL][uU][nN][tT] [fF][oO][rR][cC][eE]",allcauses)) 
  } else if(length(sh)>0){
    n=length(grep("[sS][hH][oO][oO][tT][iI][nN][gG]",allcauses))
  } else if(length(st)>0){
    n=length(grep("[sS][tT][aA][bB][bB][iI][nN][gG]",allcauses))
  } else if(length(o)>0){
    n=length(grep("[oO][tT][hH][eE][rR]",allcauses))
  } else {
    n=length(grep("[uU][nN][kK][nN][oO][wW][nN]",allcauses))
  }
  return(n)
}