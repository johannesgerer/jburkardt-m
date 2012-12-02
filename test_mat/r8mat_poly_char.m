function p = r8mat_poly_char ( n, a )

%*****************************************************************************80
%
%% R8MAT_POLY_CHAR computes the characteristic polynomial of an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%
%    Input, real A(N,N), the N by N matrix.
%
%    Output, real P(1:N+1), the coefficients of the characteristic
%    polynomial of A.  P(N+1) contains the coefficient of X**N
%    (which will be 1), P(I+1) contains the coefficient of X**I,
%    and P(1) contains the constant term.
%

%
%  Initialize WORK1 to the identity matrix.
%
  work1 = r8mat_identity ( n );

  p(n+1) = 1.0;

  for iorder = n-1 : -1 : 0
%
%  Work2 = A * WORK1.
%
    work2(1:n,1:n) = a(1:n,1:n) * work1(1:n,1:n);
%
%  Take the trace.
%
    trace = r8mat_trace ( n, work2 );
%
%  P(IORDER) = -Trace ( WORK2 ) / ( N - IORDER )
%
    p(iorder+1) = -trace / ( n - iorder );
%
%  WORK1 := WORK2 + P(IORDER) * Identity.
%
    work1(1:n,1:n) = work2(1:n,1:n);

    for i = 1 : n
      work1(i,i) = work1(i,i) + p(iorder+1);
    end

  end

  return
end
