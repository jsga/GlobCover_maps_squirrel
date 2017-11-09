

index2num = function(i,j,Nj){
  (i-1)*Nj + j
}

build_matrix_graph = function(Ni,Nj){
  # Initialize as a sparse matrix
  mat_path = Matrix(0,ncol=N,nrow=N,sparse = T)
  
  # Loop
  count = 1  
  for(i in 1:(Ni)){
    for(j in 1:(Nj)){
      # find edges to add
      if(i>1) mat_path[count,index2num(i-1,j,Nj)] = 1
      if(i<Ni) mat_path[count,index2num(i+1,j,Nj)] = 1
      if(j>1) mat_path[count,index2num(i,j-1,Nj)] = 1
      if(j<Nj) mat_path[count,index2num(i,j+1,Nj)] = 1
      
      # add counter
      count = count+1
    }
  }
  
  return(mat_path)
}