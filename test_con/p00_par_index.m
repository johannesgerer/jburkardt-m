function par_index = p00_par_index ( problem, option, nvar, x )

%*****************************************************************************80
%
%% P00_PAR_INDEX chooses the index of the continuation parameter.
%
%  Discussion:
%
%    Given the NVAR-dimensional point X, the (NVAR-1)-dimensional function 
%    F(X), and the NVAR-1 by NVAR jacobian matrix, let the NVAR-dimensional 
%    vector TAN be any null vector of JAC.
%
%      JAC * TAN = 0
%
%    Choose PAR_INDEX to be the index of TAN of maximum absolute value.
%     
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2008
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
%    Input, real X(NVAR), the starting point of Newton's method.
%
%    Output, integer PAR_INDEX, the index of the parameter to be held fixed.
%    This variable will be between 1 and NVAR.  It is the index of the variable
%    which is currently changing most rapidly along the curve F(X) = 0.
%
  tan = p00_tan ( problem, option, nvar, x );

  par_index = r8vec_amax_index ( nvar, tan );

  return
end
