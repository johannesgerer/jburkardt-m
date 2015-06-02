function subset_sum_serial_test01 ( )

%*****************************************************************************80
%
%% SUBSET_SUM_SERIAL_TEST01 tests the SUBSET_SUM_SERIAL program.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 May 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_SUM_SERIAL_TEST01\n' );
  fprintf ( 1, '  Test the SUBSET_SUM_SERIAL function, which looks for a selection\n' );
  fprintf ( 1, '  from a set of weights that adds up to a given target.\n' );
%
%  Define the problem data.
%
  target = 2463098;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Target value:\n' );
  fprintf ( 1, '      %8d\n', target );

  weight = [ ...
    518533, 1037066, 2074132, 1648264, 796528, ...
   1593056,  686112, 1372224,  244448, 488896, ...
    977792, 1955584, 1411168,  322336, 644672, ...
   1289344,   78688,  157376,  314752, 629504, ...
   1259008 ];

  n = length ( weight );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I      W(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %8d\n', i, weight(i) );
  end

  choose = subset_sum_serial ( n, weight, target );

  if ( choose(1) == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No solution was found.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '   I*     W*\n' );
    fprintf ( 1, '\n' );
    w_sum = 0;
    for i = 1 : n
      if ( choose(i) == 1 )
        fprintf ( 1, '  %2d  %8d\n', i, weight(i) );
        w_sum = w_sum + weight(i);
      end
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, ' Sum  %8d\n', w_sum );
  end

  return
end

