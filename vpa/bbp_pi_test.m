function bbp_pi_test ( )

%*****************************************************************************80
%
%% BBP_PI_TEST tests the BBP_PI function.
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
  fprintf ( 1, 'BBP_PI_TEST\n' );
  fprintf ( 1, '  BBP_PI can compute 13 hexadecimal digits at a time\n' );
  fprintf ( 1, '  in the value of pi using the Bailey-Borwein-Plouffe approach.\n' );
  fprintf ( 1, '  Usually the first 11 or 12 digits are accurate.\n' );
%
%  Get pi to 10, 20, 40, 80 hexadecimal digits:
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Request PI to 10, 20, 40, 80 hexadecimal digits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Digits   PI:\n' );
  fprintf ( 1, '\n' );

  d = 10;

  for i = 1 : 4

    fprintf ( 1, '  0:%2d  ', 10 * i - 1 );
    
    for j = 1 : i
      d = ( j - 1 ) * 10;
      p = bbp_pi ( d );
      fprintf ( 1, '%s', p(1:10) );
    end
    fprintf ( 1, '\n' );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Correct hexadecimal representation of pi to 80 hexadecimal digits:\n' );
  fprintf ( 1, '              1         2         3         4         5         6         7         8\n' );
  fprintf ( 1, '    012345678901234567890123456789012345678901234567890123456789012345678901234567890\n' );
  fprintf ( 1, '  3.243F6A8885A308D313198A2E03707344A4093822299F31D0082EFA98EC4E6C89452821E638D01377B\n' );
%
%  Timings.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  How long does it take to compute 13 digits of PI starting at digit D?\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '               D         Seconds\n' );
  fprintf ( 1, '\n' );
  d = 2;
  for i = 1 : 20
    tic
    p = bbp_pi ( d );
    t = toc;
    fprintf ( 1, '  %2d  %10d  %14g\n', i, d, t ); 
    d = d * 2;
  end

  return
end



