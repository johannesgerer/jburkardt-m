function tan = p00_tan ( problem, option, nvar, x )

%*****************************************************************************80
%
%% P00_TAN determines a tangent vector at X.
%
%  Discussion:
%
%    If X is a solution of F(Y) = 0, then the vector TAN
%    is tangent to the curve of solutions at X.
%
%    If X is not a solution of F(Y) = 0, then the vector TAN
%    is tangent to the curve F(Y) = F(X) at X.
%
%    The vector will have unit euclidean norm.
%
%    The sign of TAN will be chosen so that the determinant
%    of F'(X) augmented with a final row equal to TAN will be positive.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the evaluation point.
%
%    Output, real TAN(NVAR), a tangent vector at X.
%

%
%  Compute the jacobian.
%
  jac = p00_jac ( problem, option, nvar, x );
%
%  Compute the QR factorization of JAC'.
%
  [ q, r ] = qr ( jac' );

  tan(1:nvar,1) = q(1:nvar,nvar);
%
%  Choose the sign of TAN by the determinant condition.
%
  jac(nvar,1:nvar) = tan(1:nvar,1);

  d = det ( jac );

  if ( d < 0.0 )
    tan(1:nvar) = - tan(1:nvar);
  end

  return
end
