function title = p00_title ( test )

%*****************************************************************************80
%
%% P00_TITLE returns the title of any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the test problem index.
%
%    Output, string TITLE, the title of the test problem.
%
  if ( test == 1 )
    title = 'Problem 1, Enright and Pryce #A1';
  elseif ( test == 2 )
    title = 'Problem 2, Enright and Pryce #A2';
  elseif ( test == 3 )
    title = 'Problem 3, Enright and Pryce #A3';
  elseif ( test == 4 )
    title = 'Problem 4, Enright and Pryce #A4';
  elseif ( test == 5 )
    title = 'Problem 5, Enright and Pryce #A5';
  elseif ( test == 6 )
    title = 'Problem 6, Enright and Pryce #B1';
  elseif ( test == 7 )
    title = 'Problem 7, Enright and Pryce #B2';
  elseif ( test == 8 )
    title = 'Problem 8, Enright and Pryce #B3';
  elseif ( test == 9 )
    title = 'Problem 9, Enright and Pryce #B4';
  elseif ( test == 10 )
    title = 'Problem 10, Enright and Pryce #B5';
  elseif ( test == 11 )
    title = 'Problem 11, Enright and Pryce #C1';
  elseif ( test == 12 )
    title = 'Problem 12, Enright and Pryce #C2';
  elseif ( test == 13 )
    title = 'Problem 13, Enright and Pryce #C3';
  elseif ( test == 14 )
    title = 'Problem 14, Enright and Pryce #C4';
  elseif ( test == 15 )
    title = 'Problem 15, Enright and Pryce #C5';
  elseif ( test == 16 )
    title = 'Problem 16, Enright and Pryce #D1';
  elseif ( test == 17 )
    title = 'Problem 17, Enright and Pryce #D2';
  elseif ( test == 18 )
    title = 'Problem 18, Enright and Pryce #D3';
  elseif ( test == 19 )
    title = 'Problem 19, Enright and Pryce #D4';
  elseif ( test == 20 )
    title = 'Problem 20, Enright and Pryce #D5';
  elseif ( test == 21 )
    title = 'Problem 21, Enright and Pryce #E1';
  elseif ( test == 22 )
    title = 'Problem 22, Enright and Pryce #E2';
  elseif ( test == 23 )
    title = 'Problem 23, Enright and Pryce #E3';
  elseif ( test == 24 )
    title = 'Problem 24, Enright and Pryce #E4';
  elseif ( test == 25 )
    title = 'Problem 25, Enright and Pryce #E5';
  elseif ( test == 26 )
    title = 'Problem 26, Enright and Pryce #F1';
  elseif ( test == 27 )
    title = 'Problem 27, Enright and Pryce #F2';
  elseif ( test == 28 )
    title = 'Problem 28, Enright and Pryce #F3';
  elseif ( test == 29 )
    title = 'Problem 29, Enright and Pryce #F4';
  elseif ( test == 30 )
    title = 'Problem 30, Enright and Pryce #F5';
  elseif ( test == 31 )
    title = 'Problem 31, Lotka-Volterra Predator-Prey Equations.';
  elseif ( test == 32 )
    title = 'Problem 32, The Lorenz System';
  elseif ( test == 33 )
    title = 'Problem 33, The Van der Pol equation';
  elseif ( test == 34 )
    title = 'Problem 34, The Linearized Damped Pendulum';
  elseif ( test == 35 )
    title = 'Problem 35, The Nonlinear Damped Pendulum';
  elseif ( test == 36 )
    title = 'Problem 36, Duffing''s Equation';
  elseif ( test == 37 )
    title = 'Problem 37, Duffing''s Equation with Damping and Forcing';
  elseif ( test == 38 )
    title = 'Problem 38, Shampine''s Ball of Flame';
  elseif ( test == 39 )
    title = 'Problem 39, Polking''s First Order System';
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
