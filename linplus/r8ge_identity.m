function a = r8ge_identity ( n )

%*****************************************************************************80
%
%% R8GE_IDENTITY copies the identity matrix to a R8GE matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the N by N identity matrix.
%
  a(1:n,1:n) = 0.0;

  for i = 1 : n
    a(i,i) = 1.0;
  end 

  return
end
