#!/usr/bin/awk -f

# compare(i1,v1,i2,v2) compares the value of the associative array.
function compare(i1,v1,i2,v2){
  return v2-v1
}

# setapplicants() sets the index with id,alumni,affirmative action and weight as the values.
function setapplicants(){
  for(i=1;i<=NF;++i){
    split($i,fields,"  ")
    applicants[fields[ids]fields[alm]fields[afm]]=fields[gpa]*12500+fields[psg]*10000+fields[gpa]*.1
  }
}

# getapplicants() sorts the applicants and prints the argument number of applicants.
function getapplicants(){
  asorti(applicants,admissions,"compare")
  for(info in admissions){
    if(countalaf<maxalm&&substr(admissions[info],8,1)=="T"){
      ++countalaf
      printf("%d\n",strtonum(admissions[info]))
    }else if(countalaf<maxafm&&substr(admissions[info],9,1)=="T"){
      ++countalaf
      printf("%d\n",strtonum(admissions[info]))
    }else if(countalaf+count<spots){
      ++count
      printf("%d\n",strtonum(admissions[info]))
    }else{
      break
    }
  }
}

BEGIN{
  FS="\n"
  ids=1
  gpa=2
  alm=3
  afm=5
  psg=7
  maxalm=spots*.2
  maxafm=spots*.3
}

{
  setapplicants()
}

END{
  getapplicants()
}
