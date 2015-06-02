function matlab_mistake_test01 ( )

%*****************************************************************************80
%
%% MATLAB_MISTAKE_TEST01 puts numbers in an array, except they don't get there!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATLAB_MISTAKE_TEST01:\n' );
  fprintf ( 1, '  Set X(I) = 1 / ( I - 5 ) for I = 1 to 10\n' );
  fprintf ( 1, '  but set X(5) to zero.\n' );

  x = zeros ( 10, 1 );

  for i = 1 : 10
    if ( x(i) ~= 5 )
      x(i) == 1 / ( i - 5 ); 
    else
      x(i) = 0;
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now let''s print out X!\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    fprintf ( 1, '  X(%d) = %d\n', i, x(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  That was NOT what we expected!\n' );

  return
end

