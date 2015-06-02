function nested_sequence_display ( list_filename )

%*****************************************************************************80
%
%% NESTED_SEQUENCE_DISPLAY plots a nested set of sequences.
%
%  Discussion:
%
%    The program reads, one at a time, the names of files containing sequences.
%
%    It plots each sequence along the X axis, stacking them one by one in the Y
%    axis.  If two successive sequences have a matching value, a vertical red line is
%    drawn between them to emphasize this.
%
%    This display is intended for nested sequences, but it will show whatever 
%    you have got.
%
%  Example:
%
%    Sequence 4: 1    3    5  6  7  8
%                |         |     |
%    Sequence 3: 1         5     7
%                |               |
%    Sequence 2: 1    3          7
%                |
%    Sequence 1: 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  timestamp ( );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NESTED_SEQUENCE_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Print a "stack" of sequences, which are nested\n' );
  fprintf ( 1, '  If two successive sequences have a matching value,\n' );
  fprintf ( 1, '  a vertical red line will join them.\n' );

  if ( nargin < 1 )
    list_filename = input ( 'Enter the name of the file of sequence file names:  ' );
  end
%
%  Keep track of the X range so we can properly scale the plot.
%
  x_min = + Inf;
  x_max = - Inf;

  list_unit = fopen ( list_filename, 'rt' );

  if ( list_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NESTED_SEQUENCE_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  Could not open list file "%s".\n', list_filename );
    error ( 'NESTED_SEQUENCE_DISPLAY - Fatal error!\n' );
  end
%
%  Get the sequences, one by one.
%
  sequence_num = 0;

  while ( 1 )

    sequence_filename = fgetl ( list_unit );

    if ( sequence_filename == -1 )
      break
    end

    temp = load ( sequence_filename );
    x_min = min ( x_min, min ( temp ) );
    x_max = max ( x_max, max ( temp ) );

    sequence_num = sequence_num + 1;
    n = size ( temp, 1 );

    sequence_length(sequence_num) = n;
    sequence_list(sequence_num,1:n) = temp(1:n)';

  end

  if ( sequence_num <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NESTED_SEQUENCE_DISPLAY - Warning!\n' );
    fprintf ( 1, '  No sequence files were read from the list file.\n' );
    fprintf ( 1, '  No plot will be created.\n' );
    return
  end
%
%  Start plotting the sequences.  
%  The first sequence will have Y coordinate 1.
%
  clf

  hold on

  tick = [];
  tick_label = [];

  for sequence = 1 : sequence_num

    n = sequence_length(sequence);
    tick_label = [ tick_label, n ];
%
%  Draw black horizontal lines.
%
    h = line ( [ x_min, x_max ], [ sequence, sequence ] );
    set ( h, 'Color', 'k', 'LineWidth', 1 );
%
%  Draw red vertical lines connecting common points in successive sequences.
%    
    if ( 1 < sequence )
      for i1 = 1 : sequence_length(sequence)
        for sequence2 = 1 : sequence - 1
          for i2 = 1 : sequence_length(sequence2)
            if ( sequence_list(sequence,i1) == sequence_list(sequence2,i2) )
              x = sequence_list(sequence,i1);
              y1 = sequence;
              y2 = sequence2;
              h = line ( [ x, x ], [ y1, y2 ] );
              set ( h, 'Color', 'r', 'LineWidth', 2 );
            end
          end
        end
      end
    end

  end
%
%  Draw blue points.
%
  for sequence = 1 : sequence_num

    n = sequence_length(sequence);
    y(1:n) = sequence;
    plot ( sequence_list(sequence,1:n), y(1:n), 'b.', 'MarkerSize', 25 );

  end

  fclose ( list_unit );
%
%  Adjust the axis to be about 10 percent bigger than the data.
%
  axis ( [ x_min-0.05*(x_max-x_min), x_max+0.05*(x_max-x_min), ...
         1 - 0.05 * sequence_num, sequence_num + 0.05 * sequence_num ] );
%
%  Labels.
%  The trailing blanks are there for a reason!
%  Somehow, MATLAB contrives to screw up the last character!
%
  xlabel ( '<--- X --->  ', ...
    'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16  );

  ylabel ( 'Number of Points  ', ...
    'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16, 'Rotation', 90 );

% label = 'Gauss-Legendre Sequence';
% label = 'Nested Clenshaw-Curtis Sequence';
  label = 'Gauss-Patterson Sequence';

  title ( label, ...
    'FontName', 'Helvetica', 'FontWeight', ...
    'bold', 'FontSize', 16 );

  ticks = 1 : sequence_num;

  set ( gca, 'Ytick', ticks );
  set ( gca, 'YtickLabel', tick_label );

  hold off

  filename = 'nested_sequence.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved in file "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NESTED_SEQUENCE_DISPLAY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function r8vec_print ( n, a, title )

%*****************************************************************************80
%
%% R8VEC_PRINT prints a real vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, real A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%6d: %12g\n', i, a(i) );
  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
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
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
