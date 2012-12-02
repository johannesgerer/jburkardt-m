function subset_test080 ( )

%*****************************************************************************80
%
%% TEST080 tests MORSE_THUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST080\n' );
  fprintf ( 1, '  MORSE_THUE computes the Morse-Thue numbers.\n' );
  fprintf ( 1, '\n' );

  for i = 0 : n
    s(i+1) = morse_thue ( i );
  end

  for ilo = 0 : 10 : n
    ihi = min ( ilo + 9, n );
    fprintf ( 1, '    ' );
    for i = ilo+1 : ihi+1
      fprintf ( 1, '%d', s(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
