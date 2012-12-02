function value = r4_aint ( x )

%*****************************************************************************80
%
%% R4_AINT truncates an R4 argument to an integer.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2011
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the truncated version of X.
%
  if ( x < 0.0 )
    value = - floor ( abs ( x ) );
  else
    value =   floor ( abs ( x ) );
  end

  return
end
