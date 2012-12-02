function p = r8ge_poly ( n, a )

%*****************************************************************************80
%
%% R8GE_POLY computes the characteristic polynomial of a R8GE matrix.
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
%    26 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A(N,N), the R8GE matrix.
%
%    Output, real P(1:N+1), the coefficients of the characteristic
%    polynomial of A.  P(I+1) contains the coefficient of X**I.
%

%
%  Initialize WORK1 to the identity matrix.
%
  work1(1:n,1:n) = r8ge_identity ( n );

  p(n+1) = 1.0;

  for order = n-1 : -1 : 0
%
%  Work2 = A * WORK1.
%
    work2(1:n,1:n) = a(1:n,1:n) * work1(1:n,1:n);
%
%  Take the trace.
%
    trace = 0.0;
    for i = 1 : n
      trace = trace + work2(i,i);
    end
%
%  P(ORDER) = -Trace ( WORK2 ) / ( N - ORDER )
%
    p(order+1) = -trace / ( n - order );
%
%  WORK1 := WORK2 + P(ORDER) * Identity.
%
    work1(1:n,1:n) = work2(1:n,1:n);

    for i = 1 : n
      work1(i,i) = work1(i,i) + p(order+1);
    end

  end

  return
end
