function a = poisson ( n );

%*****************************************************************************80
%
%% POISSON makes a Poisson matrix.
%
%  Discussion:
%
%    The Poisson matrix is a block matrix.  Its block structure is
%    suggested by the following picture, which is appropriate for
%    N = 5:
%
%      A = ( D O - - - )
%          ( O D O - - )
%          ( - O D O - )
%          ( - - O D O )
%          ( - - - O D )
%
%    Here, in turn, the D matrix is a tridiagonal matrix with constant 
%    diagonal 4, and constant immediate offdiagonals of -1,
%    and the O matrix is the negative of the identity matrix.
%
%  Modified:
%
%    08 March 2005
%
%  Parameters:
%
%    Input, integer N, the block order of the matrix..
%
%    Output, real A(N*N,N*N), the Poisson matrix.
%
  n2 = n * n;
  d = zeros ( n, n );
  o = -eye ( n, n );

  for i = 1 : n
    d(i,i) = 4.0; 
  end

  for i = 1 : n-1
    d(i,i+1) = -1.0; 
    d(i+1,i) = -1.0;
  end

  a = zeros ( n2, n2 );

  for ib = 1 : n
    a(1+(ib-1)*n:ib*n,1+(ib-1)*n:ib*n) = d; 
  end

  for ib = 1 : n-1
    a(1+(ib-1)*n:ib*n,1+ib*n:(ib+1)*n) = o;
    a(1+ib*n:(ib+1)*n,1+(ib-1)*n:ib*n) = o; 
  end

  return
end

