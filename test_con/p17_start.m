function x = p17_start ( option, nvar )

%*****************************************************************************80
%
%% P17_START returns a starting point for problem 17.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
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
%    Output, real X(NVAR), the starting point.
%
  x = zeros ( nvar, 1 );

  x(1) = 0.3564320;
  x(2) = 1.636071;
  x(3) = 9.999810;
  x(4) = 2.643568;
  x(5) = 2.341926;
  x(6) = 0.3732447E-01;
  x(7) = 0.6681509E-02;
  x(8) = 0.4128999E-03;
  x(9) = 0.3790901E-03;
  x(10) = 0.1190167E-04;

  if ( option == 1 )
    x(11) = 1.0;
    x(12) = 5.0;
  elseif ( option == 2 )
    x(11) = 1.0;
    x(12) = 5.0;
  end

  return
end
