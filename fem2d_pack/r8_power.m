function value = r8_power ( r, p )

%*****************************************************************************80
%
%% R8_POWER computes the P-th power of R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the base.
%
%    Input, integer P, the power, which may be negative.
%
%    Output, real VALUE, the value of R**P.
%
  mults = 0;
%
%  Force P to be an integer.
%
  p = floor ( p );

%
%  Special case.  R^0 = 1.
%
  if ( p == 0 )
    value = 1.0;
%
%  Special case.  Positive powers of 0 are 0.
%  For negative powers, we go ahead and compute it, hoping software will complain.
%
  elseif ( r == 0.0 )
    if ( 0 < p )
      value = 0.0;
    else
      value = r^p;
    end
  elseif ( 1 <= p )
    value = r^p;
  else
    value = r^p;
  end

  return
end
