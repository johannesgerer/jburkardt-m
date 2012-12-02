function jac = p17_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P17_JAC evaluates the jacobian for problem 17.
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
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, X(NVAR), the point where the jacobian is evaluated.
%
%    Output, real JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );

  xsum = sum ( x(1:10) );

  jac(1,1) =    1.0;
  jac(1,4) =    1.0;

  jac(2,1) =    2.0;
  jac(2,2) =    1.0;
  jac(2,4) =    1.0;
  jac(2,7) =    1.0;
  jac(2,8) =    1.0;
  jac(2,9) =    1.0;
  jac(2,10) =   2.0;
  jac(2,12) = - 1.0;

  jac(3,2) =    2.0;
  jac(3,5) =    2.0;
  jac(3,6) =    1.0;
  jac(3,7) =    1.0;

  jac(4,3) =    2.0;
  jac(4,9) =    1.0;
  jac(4,12) = - 4.0;

  jac(5,1) = x(5);
  jac(5,2) = - 0.193 * x(4);
  jac(5,4) = - 0.193 * x(2);
  jac(5,5) = x(1);

  term = - 0.002597 * 0.002597 * x(2) * x(4);

  jac(6,1) = x(6) * x(6) * x(11) + term;
  jac(6,2) = - 0.002597 * 0.002597 * x(4) * ( xsum + x(2) );
  jac(6,3) = term;
  jac(6,4) = - 0.002597 * 0.002597 * x(2) * ( xsum + x(4) );
  jac(6,5) = term;
  jac(6,6) = term + 2.0 * x(1) * x(6) * x(11);
  jac(6,7) = term;
  jac(6,8) = term;
  jac(6,9) = term;
  jac(6,10) = term;
  jac(6,11) = x(1) * x(6) * x(6);

  term = - 0.003448 * 0.003448 * x(1) * x(2);

  jac(7,1) = - 0.003448 * 0.003448 * x(2) * ( xsum + x(1) );
  jac(7,2) = - 0.003448 * 0.003448 * x(1) * ( xsum + x(2) );
  jac(7,3) = term;
  jac(7,4) = x(7) * x(7) * x(11) + term;
  jac(7,5) = term;
  jac(7,6) = term;
  jac(7,7) = 2.0 * x(4) * x(7) * x(11) + term;
  jac(7,8) = term;
  jac(7,9) = term;
  jac(7,10) = term;
  jac(7,11) = x(4) * x(7) * x(7);

  term = - 0.0001799 * x(1);

  jac(8,1) = - 0.0001799 * ( xsum + x(1) );
  jac(8,2) = term;
  jac(8,3) = term;
  jac(8,4) = x(8) * x(11) + term;
  jac(8,5) = term;
  jac(8,6) = term;
  jac(8,7) = term;
  jac(8,8) = x(4) * x(11) + term;
  jac(8,9) = term;
  jac(8,10) = term;
  jac(8,11) = x(4) * x(8);

  term = - 0.0002155 * 0.0002155 * x(1) * x(1) * x(3);

  jac(9,1) = - 0.0002155 * 0.0002155 * x(1) * x(3) * ( x(1) + 2.0 * xsum );
  jac(9,2) = term;
  jac(9,3) = - 0.0002155 * 0.0002155 * x(1) * x(1) * ( x(3) + xsum );
  jac(9,4) = 2.0 * x(4) * x(9) * x(9) * x(11) + term;
  jac(9,5) = term;
  jac(9,6) = term;
  jac(9,7) = term;
  jac(9,8) = term;
  jac(9,9) = 2.0 * x(4) * x(4) * x(9) * x(11) + term;
  jac(9,10) = term;
  jac(9,11) = x(4) * x(4) * x(9) * x(9);

  term = - 0.00003846 * x(1) * x(1);

  jac(10,1) = - 0.00003846 * x(1) * ( x(1) + 2.0 * xsum );
  jac(10,2) = term;
  jac(10,3) = term;
  jac(10,4) = 2.0 * x(4) * x(10) * x(11) + term;
  jac(10,5) = term;
  jac(10,6) = term;
  jac(10,7) = term;
  jac(10,8) = term;
  jac(10,9) = term;
  jac(10,10) = x(4) * x(4) * x(11) + term;
  jac(10,11) = x(4) * x(4) * x(10);

  if ( option == 1 )
    jac(11,11) = 1.0;
  elseif ( option == 2 )
    jac(11,12) = 1.0;
  end

  return
end
