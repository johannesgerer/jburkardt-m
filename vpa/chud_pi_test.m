function chud_pi_test ( )

%*****************************************************************************80
%
%% CHUD_PI_TEST tests the CHUD_PI function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2012
%
%  Author:
%
%    John Burkardt
%
  clear all

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHUD_PI_TEST\n' );
  fprintf ( 1, '  CHUD_PI computes the value of pi using the \n' );
  fprintf ( 1, '  Chudnovsky approach.\n' );
%
%  Get pi to 10, 20, 40, 80 decimal digits:
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Request PI to 10, 20, 40, 80 digits.\n' );
  fprintf ( 1, '\n' );
%
%  Trying to print P out neatly using concatenation fails here,
%  although it works in AGM_PI_TEST.  
%
%  The procedure for printing out the D-digit representation of
%  a symbolic variable (if you are not willing to simply name
%  the variable and have its value plop out on the screen) is
%  not apparent to me!
%
  d = 10;

  for i = 1 : 4

    p = chud_pi ( d );

    fprintf ( 1, '  Request %6d digits:', d );
    p
    d = d * 2;

  end
%
%  Timings.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  How long does it take to compute PI to D digits?\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          Digits    Seconds\n' );
  fprintf ( 1, '\n' );
  d = 2;
  for i = 1 : 13
    tic
    p = chud_pi ( d );
    t = toc;
    fprintf ( 1, '  %2d  %10d  %14g\n', i, d, t ); 
    d = d * 2;
  end

  return
end



