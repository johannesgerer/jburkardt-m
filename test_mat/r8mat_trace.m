function trace = r8mat_trace ( n, a )

%*****************************************************************************80
%
%% R8MAT_TRACE computes the trace of an R8MAT.
%
%  Discussion:
%
%    The trace of a square matrix is the sum of the diagonal elements.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%
%    Input, real A(N,N), the matrix whose trace is desired.
%
%    Output, real TRACE, the trace of the matrix.
%
  trace = 0.0;
  for i = 1 : n
    trace = trace + a(i,i);
  end

  return
end
