function value = r8_cube_root ( x )

%*****************************************************************************80
%
%% R8_CUBE_ROOT returns the cube root of an R8.
%
%  Discussion:
%
%    This routine is designed to avoid the possible problems that can occur
%    when formulas like 0.0**(1/3) or (-1.0)**(1/3) are to be evaluated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose cube root is desired.
%
%    Output, real VALUE, the cube root of X.
%
  if ( 0.0 < x )
    value = x.^(1.0/3.0);
  elseif ( x == 0.0 )
    value = 0.0;
  else
    value = -( abs ( x ) ).^(1.0/3.0);
  end

  return
end
