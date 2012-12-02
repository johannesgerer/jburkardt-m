function test_min_test05 ( )

%*****************************************************************************80
%
%% TEST_MIN_TEST05 carries out a simple bisection method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 February 2009
%
%  Author:
%
%    John Burkardt
%
  max_step = 10;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MIN_TEST05\n' );
  fprintf ( 1, '  For each problem, take a few steps of\n' );
  fprintf ( 1, '  the bisection method.\n' );
%
%  Get the number of problems.
%
  problem_num = p00_problem_num ( );

  for problem = 1 : problem_num

    title = p00_title ( problem );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', problem );
    fprintf ( 1, '  %s\n', title );

    [ a, c ] = p00_interval ( problem );
    b = 0.5 * ( a + c );
    fa = p00_f ( problem, a );
    fb = p00_f ( problem, c );
    fc = p00_f ( problem, b );

    i = 0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %d\n', i );
    fprintf ( 1, '  X:  %12e  %12e  %12e\n', a, b, c ); 
    fprintf ( 1, '  F:  %12e  %12e  %12e\n', fa, fb, fc );

    for i = 1 : max_step

      d = 0.5 * ( a + b );
      fd = p00_f ( problem, d );

      e = 0.5 * ( b + c );
      fe = p00_f ( problem, e );

      if ( fd <= fb )
        c = b;
        fc = fb;
        b = d;
        fb = fd;
      elseif ( fe <= fb )
        a = b;
        fa = fb;
        b = e;
        fb = fe;
      else
        a = d;
        fa = fd;
        c = e;
        fc = fe;
      end

      fprintf ( 1, '  %d\n', i );
      fprintf ( 1, '  X:  %12e  %12e  %12e\n', a, b, c ); 
      fprintf ( 1, '  F:  %12e  %12e  %12e\n', fa, fb, fc );

    end

  end

  return
end
