function r8lib_test118 ( )

%*****************************************************************************80
%
%% R8LIB_TEST118 tests R8VEC_EVEN2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  nold = 5;
  maxval = 20;

  nfill = [ 4, 3, 5, 0 ];
  xold = [ 0.0, 1.0, 5.0, 2.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST118\n' );
  fprintf ( 1, '  R8VEC_EVEN2 interpolates a specified number of \n' );
  fprintf ( 1, '  points pairs of values in a vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Input data:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nold
    fprintf ( 1, '  %14f\n', xold(i) );
    if ( i < nold )
      fprintf ( 1, '  %14d\n', nfill(i) );
    end
  end
 
  [ nval, xval ] = r8vec_even2 ( maxval, nfill, nold, xold );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Resulting vector:\n' );
  fprintf ( 1, '\n' );
 
  istar = 1;
  jstar = 1;

  for i = 1 : nval
 
    if ( i == istar )

       fprintf ( 1, '  * %f\n', xval(i) );
 
      if ( jstar < nold )
        istar = istar + nfill(jstar) + 1;
        jstar = jstar + 1;
      end
 
    else
 
      fprintf ( 1, '    %f\n', xval(i) );
 
    end
 
  end

  return
end

