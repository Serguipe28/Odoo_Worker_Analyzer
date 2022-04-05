
#CONST SOFT MEMORY
CONST_SOFT=640

#CONST HARD MEMORY
CONST_HARD=768

#CONST BYTES 
CONST_BYTES=1024*1024



arithmetic() {
  echo "scale=0; $1" | bc
}


calculateNumCores(){
  echo $(nproc)
}

calculateWorkers(){
    echo $(arithmetic "$(calculateNumCores) *2 + 1") 
}

calculateLimitMemoryHard() {
  echo $(arithmetic "$CONST_HARD * $(calculateWorkers) * $CONST_BYTES")
}
calculateLimitMemorySoft() {
  echo $(arithmetic "$CONST_SOFT * $(calculateWorkers) * $CONST_BYTES")
}




#Execute 
echo "workers=$(calculateWorkers)"
echo "limit_memory_soft=$(calculateLimitMemorySoft)"
echo "limit_memory_hard=$(calculateLimitMemoryHard)"
echo "limit_request = 8192"
echo "limit_time_cpu = 60"
echo "limit_time_real = 120"


