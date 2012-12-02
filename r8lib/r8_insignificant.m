function value = r8_insignificant ( r, s )

%*****************************************************************************80
%
%% R8_INSIGNIFICANT determines if an R8 is insignificant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ( kind = 8 ) R, the number to be compared against.
%
%    Input, real ( kind = 8 ) S, the number to be compared.
%
%    Output, logical R8_INSIGNIFICANT, is TRUE if S is insignificant
%    compared to R.
%
  value = 1; 

  t = r + s
  tol = eps * abs ( r );

  if ( tol < abs ( r - t ) )
    value = 0;
  end
  
  return
end
