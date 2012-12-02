function partition_problem_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for PARTITION_PROBLEM_PRB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2012
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PARTITION_PROBLEM_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PARTITION_PROBLEM library.\n' );
%
%  Find individual solutions.
%
  for test = 1 : test_num

    if ( test == 1 )
      n = 5;
      w = [ 19; 17; 13; 9; 6 ];
    elseif ( test == 2 )
      n = 9;
      w = [ 484; 114; 205; 288; 506; 503; 201; 127; 410 ];
    elseif ( test == 3 )
      n = 10;
      w = [ 771; 121; 281; 854; 885; 734; 486; 1003; 83; 62 ];
    elseif ( test == 4 )
      n = 10;
      w = [ 2; 10; 3; 8; 5; 7; 9; 5; 3; 2 ];
    elseif ( test == 5 )
      n = 9;
      w = [ 3; 4; 3; 1; 3; 2; 3; 2; 1 ];
    end

    partition_problem_test01 ( n, w );

  end
%
%  Count solutions.
%
  for test = 1 : test_num

    if ( test == 1 )
      n = 5;
      w = [ 19; 17; 13; 9; 6 ];
    elseif ( test == 2 )
      n = 9;
      w = [ 484; 114; 205; 288; 506; 503; 201; 127; 410 ];
    elseif ( test == 3 )
      n = 10;
      w = [ 771; 121; 281; 854; 885; 734; 486; 1003; 83; 62 ];
    elseif ( test == 4 )
      n = 10;
      w = [ 2; 10; 3; 8; 5; 7; 9; 5; 3; 2 ];
    elseif ( test == 5 )
      n = 9;
      w = [ 3; 4; 3; 1; 3; 2; 3; 2; 1 ];
    end

    partition_problem_test02 ( n, w );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PARTITION_PROBLEM_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
