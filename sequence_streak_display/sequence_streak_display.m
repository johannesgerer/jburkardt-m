function sequence_streak_display ( file_name, direction )

%*****************************************************************************80
%
%% SEQUENCE_STREAK_DISPLAY makes a "streak plot" of a sequence.
%
%  Discussion:
%
%    The sequence information is assumed to be available in
%    a text file, with one sequence entry per line.
%
%    One reason for making plots this way is to try to
%    see the "fill in" pattern of a sequence.  For instance,
%    the van der Corput sequence has the property that all
%    entries lie in [0,1], and that it first eliminates all
%    gaps of size 1/2, then of size 1/4, then 1/8 and so on.
%
%    Perhaps a second reason for looking at plots this way
%    is to notice patterns of convergence in a sequence.
%
%  Example:
%
%    The sequence 1, 3, 5, 7, 6, 2, 4 would plot as
%
%       *---
%        *--
%      *----
%          *
%     *-----
%         *-
%    *------
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of a text file containing
%    the sequence.
%
%    Input, character DIRECTION, defines the direction of the sequence.
%    'R', goes to the right;
%    'L', goes to the left;
%    'U', goes up;
%    'D', goes down.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SEQUENCE_STREAK_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );

  y = load ( file_name );

  n = length ( y );
  x(1:n) = 1:n;

  if ( direction == 'R' | direction == 'r' )

    plot ( x, y, '*' );

    for i = 1 : n
      line ( [x(i), n], [y(i), y(i) ] )
    end

    xlabel ( 'Sequence Direction--->', ...
      'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16  )

    ylabel ( 'Sequence Value', ...
      'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16, 'Rotation', 90 );

    title ( 'Sequence "Streak" Plot', ...
      'FontName', 'Helvetica', 'FontWeight', ...
      'bold', 'FontSize', 16 );

  elseif ( direction == 'L' | direction == 'l' )

    plot ( x, y, '*' );

    for i = 1 : n
      line ( [1, x(i)], [y(i), y(i) ] )
    end

    xlabel ( 'Sequence Direction--->', ...
      'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16  )

    ylabel ( 'Sequence Value', ...
      'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16, 'Rotation', 90 );

    title ( 'Sequence "Streak" Plot', ...
      'FontName', 'Helvetica', 'FontWeight', ...
      'bold', 'FontSize', 16 );


  elseif ( direction == 'U' | direction == 'u' )

    plot ( y, x, '*' );

    for i = 1 : n
      line ( [y(i), y(i) ], [x(i), n] )
    end

    xlabel ( 'Sequence Value', ...
      'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16  )

    ylabel ( 'Sequence Direction--->', ...
      'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16, 'Rotation', 90 );

    title ( 'Sequence "Streak" Plot', ...
      'FontName', 'Helvetica', 'FontWeight', ...
      'bold', 'FontSize', 16 );

  elseif ( direction == 'D' | direction == 'd' )

    plot ( y, x, '*' );

    for i = 1 : n
      line ( [y(i), y(i) ], [1, x(i)] )
    end

    xlabel ( 'Sequence Value', ...
      'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16  )

    ylabel ( 'Sequence Direction--->', ...
      'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16, 'Rotation', 90 );

    title ( 'Sequence Streak Plot', ...
      'FontName', 'Helvetica', 'FontWeight', ...
      'bold', 'FontSize', 16 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SEQUENCE_STREAK_DISPLAY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1,'\n' );
  timestamp ( );

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
