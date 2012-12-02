function reduction_example ( n )

%*****************************************************************************80
%
%% REDUCTION_EXAMPLE shows an example of a parallel reduction operation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the array.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'REDUCTION_EXAMPLE:\n' );
  fprintf ( 1, '  The MATLAB PARFOR command can carry out certain\n' );
  fprintf ( 1, '  "reduction" operations in parallel.\n' );

  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    n = input ( '  Enter N, the size of the vector.\n' );
  end
%
%  Set up a random data vector.
%
  x = rand ( n );
%
%  Sum its entries.
%

  total1 = 0.0;
  for i = 1 : n
    total1 = total1 + x(i);
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum all entries of X, in sequential mode:\n' );
  fprintf ( 1, '  TOTAL1 = %f\n', total1 );
%
%  Sum its entries in parallel.
%
  total2 = 0.0;
  parfor i = 1 : n
    total2 = total2 + x(i);
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum all entries of X, in parallel mode:\n' );
  fprintf ( 1, '  TOTAL2 = %f\n', total2 );
%
%  Sum some of its entries.
%
  total3 = 0.0;
  for i = 1 : n
    if ( 0.5 < x(i) )
      total3 = total3 + x(i);
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum entries of X greater than 1/2, in sequential mode:\n' );
  fprintf ( 1, '  TOTAL3 = %f\n', total3 );
%
%  Sum some of its entries in parallel.
%
  total4 = 0.0;
  parfor i = 1 : n
    if ( 0.5 < x(i) )
      total4 = total4 + x(i);
    end
  end

  fprintf ( 1, '  Sum entries of X greater than 1/2, in parallel mode:\n' );
  fprintf ( 1, '  TOTAL4 = %f\n', total4 );

  return
end

  
