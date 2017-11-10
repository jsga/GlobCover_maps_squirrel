

index2num = function(i,j,Nj){
  (i-1)*Nj + j
}

build_matrix_graph = function(Ni,Nj,val_raster){
  
  if(Ni != Nj) stop('Matrix must be squared')
  
  N = Ni*Nj
  mat_path = Matrix(0,ncol=N,nrow=N,sparse = T)
  
  # lower blocl
  ii = 1:(N-1)+1
  jj = 1:(N-1)
  mat_path[cbind(ii,jj)] = val_raster[ii]
  
  # uppwe block
  ii = 1:(N-1)
  jj = 1:(N-1)+1
  mat_path[cbind(ii,jj)] = val_raster[ii]
  
  # make the (NiNj) zero
  # [5,6] & [6,5] == 0
  ii = c( Ni * 1:Ni, Ni * 1:Ni + 1)
  jj = c( Nj * 1:Nj+1, Ni * 1:Nj)
  idx = cbind(ii,jj)
  idx_keep = apply(idx < N,1,all)
  mat_path[idx[idx_keep,]] = 0
  
  # Make the upper long line
  ii = 1:(N-Nj)
  jj = Ni + 1:(N-Nj)
  mat_path[cbind(ii,jj)] = val_raster[ii]
  
  # lower long line
  ii = Nj + 1:(N-Ni)
  jj = 1:(N-Ni)
  mat_path[cbind(ii,jj)] = val_raster[ii]
  
  # END. Return
  return(mat_path)
}

build_matrix_graph_V2 = function(Ni,Nj){
  
  N = Ni*Nj
  mat_path = Matrix(0,ncol=N,nrow=N,sparse = T)
  
  # lower blocl
  ii = 1:(N-1)+1
  jj = 1:(N-1)
  mat_path[cbind(ii,jj)] = 1
  
  # uppwe block
  ii = 1:(N-1)
  jj = 1:(N-1)+1
  mat_path[cbind(ii,jj)] = 1
  
  # make the (NiNj) zero
  # [5,6] & [6,5] == 0
  ii = c( Ni * 1:Ni, Ni * 1:Ni + 1)
  jj = c( Nj * 1:Nj+1, Ni * 1:Nj)
  idx = cbind(ii,jj)
  idx_keep = apply(idx < N,1,all)
  mat_path[idx[idx_keep,]] = 0
  
  # Make the upper long line
  ii = 1:(N-Nj)
  jj = Ni + 1:(N-Nj)
  mat_path[cbind(ii,jj)] = 1
  
  # lower long line
  ii = Nj + 1:(N-Ni)
  jj = 1:(N-Ni)
  mat_path[cbind(ii,jj)] = 1
  
  # END. Return
  return(mat_path)
}

build_matrix_graph_V1 = function(Ni,Nj){
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