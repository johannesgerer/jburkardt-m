function value = r8_cin ( x )

%*****************************************************************************80
%
%% R8_CIN evaluates the alternate cosine integral Cin of an R8 argument.
%
%  Discussion:
%
%    CIN(X) = gamma + log(X)
%      + integral ( 0 <= T <= X ) ( cos ( T ) - 1 ) / T  dT
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the cosine integral Cin evaluated at X.
%
  persistent cincs
  persistent eul
  persistent ncin
  persistent xmin

  eul = 0.57721566490153286060651209008240;

  if ( isempty ( ncin ) )

    cincs = [ ...
      0.37074501750909688741654801228564992, ...
     -0.05893574896364446831956864397363697, ...
      0.00538189642113569124048745326203340, ...
     -0.00029860052841962135319594906563410, ...
      0.00001095572575321620077031054467306, ...
     -0.00000028405454877346630491727187731, ...
      0.00000000546973994875384912457861806, ...
     -0.00000000008124187461318157083277452, ...
      0.00000000000095868593117706609013181, ...
     -0.00000000000000920266004392351031377, ...
      0.00000000000000007325887999017895024, ...
     -0.00000000000000000049143726675842909, ...
      0.00000000000000000000281577746753902, ...
     -0.00000000000000000000001393986788501, ...
      0.00000000000000000000000006022485646, ...
     -0.00000000000000000000000000022904717, ...
      0.00000000000000000000000000000077273, ...
     -0.00000000000000000000000000000000233 ]';

    ncin = r8_inits ( cincs, 18, 0.1 * r8_mach ( 3 ) );
    xmin = sqrt ( r8_mach ( 1 ) );

  end

  absx = abs ( x );

  if ( absx <= xmin )
    value = 0.0;
  elseif ( absx <= 4.0 )
    value = r8_csevl ( ( x * x - 8.0 ) * 0.125, cincs, ncin ) * x * x;
  else
    [ f, g ] = r8_sifg ( absx );
    sinx = sin ( absx );
    value = - f * sinx + g * cos ( absx ) + log ( absx ) + eul;
  end

  return
end
