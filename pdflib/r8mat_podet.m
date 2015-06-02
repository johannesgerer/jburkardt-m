function det = r8mat_podet ( n, r )

%*****************************************************************************80
%
%% R8MAT_PODET computes the determinant of a factored positive definite matrix.
%
%  Discussion:
%
%    This routine expects to receive R, the upper triangular factor of A,
%    computed by R8MAT_POFAC, with the property that A = R' * R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real R(N,N), the Cholesky factor of A.
%
%    Output, real DET, the determinant of A.
%
  det = 1.0;
  for i = 1 : n
    det = det * r(i,i) * r(i,i);
  end

  return
end