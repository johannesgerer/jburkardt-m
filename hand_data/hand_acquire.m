function [ x, y ] = hand_acquire ( )

%*****************************************************************************80
%
%% HAND_ACQUIRE prompts the user to enter data about the hand shape.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 April 2011
%
%  Author:
%
%    Cleve Moler
%    Modifications by John Burkardt
%
%  Reference:
%
%    Cleve Moler,
%    Numerical Computing with MATLAB,
%    SIAM, 2004,
%    ISBN13: 978-0-898716-60-3,
%    LC: QA297.M625. 
%
%  Parameters:
%
%    Output, real X(*), Y(*), the screen coordinates of points selected by the
%    user using mouse clicks.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HAND_ACQUIRE:\n' );
  fprintf ( 1, '  This function will help you record the shape of your hand\n' );
  fprintf ( 1, '  as a pair of X, Y data vectors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In a moment, a blank screen will appear.\n' );
  fprintf ( 1, '  Place your hand on the screen.\n' );
  fprintf ( 1, '  Using the mouse, trace the outline of your hand, clicking\n' );
  fprintf ( 1, '  with the mouse at each point you want to record.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Once you have outlined your hand, press RETURN to save the data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Press RETURN to begin recording your hand!\n' );

  screen = get ( 0, 'ScreenSize' );
%
%  Specify the location and size of a figure window
%  that takes up the whole screen.
%
  figure ( 'Position', screen );
%
%  Create a graphical coordinate system on the figure.
%
  axes ( 'Position', [ 0, 0, 1, 1 ] );
%
%  Get input from the user.
%
  [ x, y ] = ginput ( );

  n = length ( x );

  printf ( 1, '\n' );
  printf ( 1, '  %d points were recorded.\n' );

  return
end
