function agm_pi_test ( )

%*****************************************************************************80
%
%% AGM_PI_TEST tests the AGM_PI function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2012
%
%  Author:
%
%    John Burkardt
%
  clear all

  fprintf ( 1, '\n' );
  fprintf ( 1, 'AGM_PI_TEST\n' );
  fprintf ( 1, '  AGM_PI computes the value of pi using the \n' );
  fprintf ( 1, '  arithmetic-geometric-mean approach.\n' );
%
%  Get pi to 10, 20, 40, 80 decimal digits:
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Request PI to 10, 20, 40, 80 digits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Digits   PI:\n' );
  fprintf ( 1, '\n' );

  d = 10;

  for i = 1 : 4

    p = agm_pi ( d );
    s = [ '  ', num2str(d,'%6d'), '  ', p ];
%
%  Trying to format output involving a symbolic variable seems to
%  be rather unsatisfactory.  FPRINTF won't work.  DISP can be used,
%  but you have to concatenate items first, and the concatenation operator
%  goes nuts when you have unexpected spaces in a phrase like "num2str ( d, '%6d' )"
%  and then DISP automatically prints the item PLUS an apparently unavoidable blank line
%  while suppressing all but a single blank when you inserted blanks so stuff
%  would line up, AND you also get the extraneous square brackets in your output.  
%
    disp ( s )
    d = d * 2;

  end
%
%  Timings.
%  Apparently, D = 1 is illegal input to AGM_PI!
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  How long does it take to compute PI to D digits?\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          Digits    Seconds\n' );
  fprintf ( 1, '\n' );
  d = 2;
  for i = 1 : 20
    tic
    p = agm_pi ( d );
    t = toc;
    fprintf ( 1, '  %2d  %10d  %14g\n', i, d, t ); 
    d = d * 2;
  end

  return
end



