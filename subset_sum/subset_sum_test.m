function subset_sum_test ( )

%*****************************************************************************80
%
%% SUBSET_SUM seeks a subset of a set that has a given sum.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_SUM_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SUBSET_SUM library.\n' );
%
%  Problem #1.
%
  w = [ 15, 22, 14, 26, 32, 9, 16, 8 ];
  t = 53;
  [ c, index ] = subset_sum_test01 ( w, t );
%
%  There's a second solution for problem #1.
%
  subset_sum_test01 ( w, t, [ index+1, 2^8-1] );
%
%  Problem #2.
%
  w = [   267,  493,  869,  961, 1000, 1153, 1246, 1598, 1766, 1922 ];
  t = 5842;
  [ c, index ] = subset_sum_test01 ( w, t );
%
%  Problem #3.
%
  w = [  518533, 1037066, 2074132, 1648264, 796528, ...
        1593056,  686112, 1372224,  244448, 488896, ...
         977792, 1955584, 1411168,  322336, 644672, ...
        1289344,   78688,  157376,  314752, 629504, ...
        1259008 ];
  t = 2463098;
  [ c, index ] = subset_sum_test01 ( w, t );
%
%  Problem #4.
%
  w = [ 41, 34, 21, 20,  8,  7,  7,  4,  3,  3 ];
  t = 50;
  [ c, index ] = subset_sum_test01 ( w, t );
%
%  Problem #5.
%
  w = [ 81, 80, 43, 40, 30, 26, 12, 11, 9 ];
  t = 100;
  [ c, index ] = subset_sum_test01 ( w, t );
%
%  Problem #6.
%
  w = [ 1, 2, 4, 8, 16, 32 ];
  t = 22;
  r = [ 0, 2^6 - 1 ];
  [ c, index ] = subset_sum_test01 ( w, t, r );
%
%  Problem #7.
%
  w = [ 25, 27, 3, 12, 6, 15, 9, 30, 21, 19 ];
  t = 50;
  r = [ 0, 2^10 - 1 ];
  [ c, index ] = subset_sum_test01 ( w, t, r );
%
%  Problem #1.
%
  w = [ 15, 22, 14, 26, 32, 9, 16, 8 ];
  t = 53;
  count = subset_sum_test02 ( w, t );
%
%  Problem #2.
%
  w = [   267,  493,  869,  961, 1000, 1153, 1246, 1598, 1766, 1922 ];
  t = 5842;
  count = subset_sum_test02 ( w, t );
%
%  Problem #3.
%
  w = [  518533, 1037066, 2074132, 1648264, 796528, ...
        1593056,  686112, 1372224,  244448, 488896, ...
         977792, 1955584, 1411168,  322336, 644672, ...
        1289344,   78688,  157376,  314752, 629504, ...
        1259008 ];
  t = 2463098;
  count = subset_sum_test02 ( w, t );
%
%  Problem #4.
%
  w = [ 41, 34, 21, 20,  8,  7,  7,  4,  3,  3 ];
  t = 50;
  count = subset_sum_test02 ( w, t );
%
%  Problem #5.
%
  w = [ 81, 80, 43, 40, 30, 26, 12, 11, 9 ];
  t = 100;
  count = subset_sum_test02 ( w, t );
%
%  Problem #6.
%
  w = [ 1, 2, 4, 8, 16, 32 ];
  t = 22;
  r = [ 0, 2^6 - 1 ];
  count = subset_sum_test02 ( w, t );
%
%  Problem #7.
%
  w = [ 25, 27, 3, 12, 6, 15, 9, 30, 21, 19 ];
  t = 50;
  r = [ 0, 2^10 - 1 ];
  count = subset_sum_test02 ( w, t );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_SUM_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
