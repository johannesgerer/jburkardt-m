function files_multiple ( )

%*****************************************************************************80
%
%% FILES_MULTIPLE demonstrates how to work with multiple files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 December 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FILES_MULTIPLE:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Demonstrate how to work with multiple files.\n' );

  files_multiple_test01 ( );
  files_multiple_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FILES_MULTIPLE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function files_multiple_test01 ( )

%*****************************************************************************80
%
%% TEST01 writes data to four files which are open simultaneously.
%
%  Discussion:
%
%    The files contain the integers which are divisible by 2, 3, 5, and 7.
%
%    divisor1.txt  divisor2.txt  divisor3.txt  divisor4.txt
%        0             0             0             0
%        2             3             5             7
%        4             6            10            14
%        6             9            15            21
%        8            12            20            28
%       ...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 September 2012
%
%  Author:
%
%    John Burkardt
%

%
%  FILENUM can be increased, and the program will still work the same way.
%
  filenum = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FILES_MULTIPLE_TEST01\n' );
  fprintf ( 1, '  Create 4 files, and count to 100.\n' );
  fprintf ( 1, '  "divisor1.txt" will contain multiples of 2;\n' );
  fprintf ( 1, '  "divisor2.txt" will contain multiples of 3;\n' );
  fprintf ( 1, '  "divisor3.txt" will contain multiples of 5;\n' );
  fprintf ( 1, '  "divisor4.txt" will contain multiples of 7;\n' );
%
%  Set the divisors.
%  PRIME is a function which can return the I-th prime number.
%
  for i = 1 : filenum
    divisor(i) = prime ( i );
  end
%
%  Define the file names for an arbitrary number of files
%  by incrementing the numeric information in a "template".
%
  template = 'divisor0.txt';

  for i = 1 : filenum
    template = filename_inc ( template );
    filename(i,:) = template(:);
  end
%
%  Associate a unit number with each file.
%
  for i = 1 : filenum
    fileunit(i) = fopen ( filename(i,:), 'wt' );
    fprintf ( fileunit(i), 'Multiples of %d\n', divisor(i) );
  end

  for j = 0 : 100
    for i = 1 : filenum
      if ( mod ( j, divisor(i) ) == 0 )
        fprintf ( fileunit(i), '%d\n', j );
      end
    end
  end
%
%  Close the files.
%
  for i = 1 : filenum
    fclose ( fileunit(i) );
  end

  return
end
function files_multiple_test02 ( )

%*****************************************************************************80
%
%% FILES_MULTIPLE_TEST02 writes selected data to four files which are open simultaneously.
%
%  Discussion:
%
%    The vector X contains 100 random numbers, and we update X 20 times.
%    We want to keep track of X(10), X(25), X(64) and X(81) on each step.
%
%              x1.txt        x2.txt        x3.txt        x4.txt
%           X(10) values  X(25) values  X(64) values  X(81) values
%     1         2.1           1.7           5.3           9.8
%     2         2.0           3.6           6.2           7.3
%     3         2.5           4.1           5.9           6.8
%    ..   
%    10         5.0           5.2           5.3           5.6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 December 2012
%
%  Author:
%
%    John Burkardt
%

%
%  FILENUM can be increased, but more entries in K would have to be defined
%  by the user.
%
  filenum = 4;
  n = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FILES_MULTIPLE_TEST02\n' );
  fprintf ( 1, '  Create 4 files.\n' );
  fprintf ( 1, '  The vector X contains 100 values,\n' );
  fprintf ( 1, '  and is set 20 times.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Write X(10), X(25), X(64) and X(81) to the files\n' );
  fprintf ( 1, '  "x1.txt", "x2.txt", "x3.txt" and "x4.txt"\n' );
%
%  Define the selected X indices.
%
  k(1:4) = [ 10, 25, 64, 81 ];
%
%  Define the file names for an arbitrary number of files
%  by incrementing the numeric information in a "template".
%
  template = 'x0.txt';

  for i = 1 : filenum
    template = filename_inc ( template );
    filename(i,:) = template(:);
  end
%
%  Associate a unit number with each file
%
  for i = 1 : filenum
    fileunit(i) = fopen ( filename(i,:), 'wt' );
    fprintf ( fileunit(i), 'Values of X(%d)\n', k(i) );
  end
%
%  Initial X vector is random.
%
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Write selected data to file, then update data.
%
  for j = 0 : 20

    for i = 1 : filenum
      fprintf ( fileunit(i), '  %2d  %14.6g\n', j, x(k(i)) );
    end

    if ( j < 20 )
      y(1) = ( x(1) + x(2) ) / 2.0;
      y(2:99) = ( x(1:98) + x(2:99) + x(3:100) ) / 3.0;
      y(100) = ( x(99) + x(100) ) / 2.0;

      x(1:100) = y(1:100);
    end

  end
%
%  Close the files.
%
  for i = 1 : filenum
    fclose ( fileunit(i) );
  end

  return
end
function filename = filename_inc ( filename )

%*****************************************************************************80
%
%% FILENAME_INC increments a partially numeric filename.
%
%  Discussion:
%
%    It is assumed that the digits in the name, whether scattered or
%    connected, represent a number that is to be increased by 1 on
%    each call.  If this number is all 9's on input, the output number
%    is all 0's.  Non-numeric letters of the name are unaffected..
%
%    If the name is empty, then the routine stops.
%
%    If the name contains no digits, the empty string is returned.
%
%  Example:
%
%      Input            Output
%      -----            ------
%      'a7to11.txt'     'a7to12.txt'  (typical case.  Last digit incremented)
%      'a7to99.txt'     'a8to00.txt'  (last digit incremented, with carry.)
%      'a9to99.txt'     'a0to00.txt'  (wrap around)
%      'cat.txt'        ' '           (no digits in input name.)
%      ' '              STOP%         (error.)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the string to be incremented.
%
%    Output, string FILENAME, the incremented string.
%
  lens = length ( filename );

  if ( lens <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILENAME_INC - Fatal error%\n' );
    fprintf ( 1, '  The input filename is empty.\n' );
    error ( 'FILENAME_INC - Fatal error%' );
  end

  change = 0;

  for i = lens : -1 : 1

    c = filename(i);

    if ( '0' <= c && c <= '8' )

      c = c + 1;
      
      filename(i) = c;

      return

    elseif ( c == '9' )

      change = change + 1;

      c = '0';
      
      filename(i) = c;

    end

  end
%
%  No digits were found.  Return blank.
%
  if ( change == 0 )
    filename = ' ';
  end

  return
end
function p = prime ( n )

%*****************************************************************************80
%
%% PRIME returns returns any of the first PRIME_MAX prime numbers.
%
%  Discussion:
%
%    PRIME_MAX is 1600, and the largest prime stored is 13499.
%
%    Thanks to Bart Vandewoestyne for pointing out a typo, 18 February 2005.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964, pages 870-873.
%
%    Daniel Zwillinger,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996, pages 95-98.
%
%  Parameters:
%
%    Input, integer N, the index of the desired prime number.
%    In general, is should be true that 0 <= N <= PRIME_MAX.
%    N = -1 returns PRIME_MAX, the index of the largest prime available.
%    N = 0 is legal, returning PRIME = 1.
%
%    Output, integer P, the N-th prime.  If N is out of range, P
%    is returned as -1.
%
  prime_max = 1600;

  prime_vector(1:1600) = [
        2,    3,    5,    7,   11,   13,   17,   19,   23,   29, ...
       31,   37,   41,   43,   47,   53,   59,   61,   67,   71, ...
       73,   79,   83,   89,   97,  101,  103,  107,  109,  113, ...
      127,  131,  137,  139,  149,  151,  157,  163,  167,  173, ...
      179,  181,  191,  193,  197,  199,  211,  223,  227,  229, ...
      233,  239,  241,  251,  257,  263,  269,  271,  277,  281, ...
      283,  293,  307,  311,  313,  317,  331,  337,  347,  349, ...
      353,  359,  367,  373,  379,  383,  389,  397,  401,  409, ...
      419,  421,  431,  433,  439,  443,  449,  457,  461,  463, ...
      467,  479,  487,  491,  499,  503,  509,  521,  523,  541, ...
      547,  557,  563,  569,  571,  577,  587,  593,  599,  601, ...
      607,  613,  617,  619,  631,  641,  643,  647,  653,  659, ...
      661,  673,  677,  683,  691,  701,  709,  719,  727,  733, ...
      739,  743,  751,  757,  761,  769,  773,  787,  797,  809, ...
      811,  821,  823,  827,  829,  839,  853,  857,  859,  863, ...
      877,  881,  883,  887,  907,  911,  919,  929,  937,  941, ...
      947,  953,  967,  971,  977,  983,  991,  997, 1009, 1013, ...
     1019, 1021, 1031, 1033, 1039, 1049, 1051, 1061, 1063, 1069, ...
     1087, 1091, 1093, 1097, 1103, 1109, 1117, 1123, 1129, 1151, ...
     1153, 1163, 1171, 1181, 1187, 1193, 1201, 1213, 1217, 1223, ...
     1229, 1231, 1237, 1249, 1259, 1277, 1279, 1283, 1289, 1291, ...
     1297, 1301, 1303, 1307, 1319, 1321, 1327, 1361, 1367, 1373, ...
     1381, 1399, 1409, 1423, 1427, 1429, 1433, 1439, 1447, 1451, ...
     1453, 1459, 1471, 1481, 1483, 1487, 1489, 1493, 1499, 1511, ...
     1523, 1531, 1543, 1549, 1553, 1559, 1567, 1571, 1579, 1583, ...
     1597, 1601, 1607, 1609, 1613, 1619, 1621, 1627, 1637, 1657, ...
     1663, 1667, 1669, 1693, 1697, 1699, 1709, 1721, 1723, 1733, ...
     1741, 1747, 1753, 1759, 1777, 1783, 1787, 1789, 1801, 1811, ...
     1823, 1831, 1847, 1861, 1867, 1871, 1873, 1877, 1879, 1889, ...
     1901, 1907, 1913, 1931, 1933, 1949, 1951, 1973, 1979, 1987, ...
     1993, 1997, 1999, 2003, 2011, 2017, 2027, 2029, 2039, 2053, ...
     2063, 2069, 2081, 2083, 2087, 2089, 2099, 2111, 2113, 2129, ...
     2131, 2137, 2141, 2143, 2153, 2161, 2179, 2203, 2207, 2213, ...
     2221, 2237, 2239, 2243, 2251, 2267, 2269, 2273, 2281, 2287, ...
     2293, 2297, 2309, 2311, 2333, 2339, 2341, 2347, 2351, 2357, ...
     2371, 2377, 2381, 2383, 2389, 2393, 2399, 2411, 2417, 2423, ...
     2437, 2441, 2447, 2459, 2467, 2473, 2477, 2503, 2521, 2531, ...
     2539, 2543, 2549, 2551, 2557, 2579, 2591, 2593, 2609, 2617, ...
     2621, 2633, 2647, 2657, 2659, 2663, 2671, 2677, 2683, 2687, ...
     2689, 2693, 2699, 2707, 2711, 2713, 2719, 2729, 2731, 2741, ...
     2749, 2753, 2767, 2777, 2789, 2791, 2797, 2801, 2803, 2819, ...
     2833, 2837, 2843, 2851, 2857, 2861, 2879, 2887, 2897, 2903, ...
     2909, 2917, 2927, 2939, 2953, 2957, 2963, 2969, 2971, 2999, ...
     3001, 3011, 3019, 3023, 3037, 3041, 3049, 3061, 3067, 3079, ...
     3083, 3089, 3109, 3119, 3121, 3137, 3163, 3167, 3169, 3181, ...
     3187, 3191, 3203, 3209, 3217, 3221, 3229, 3251, 3253, 3257, ...
     3259, 3271, 3299, 3301, 3307, 3313, 3319, 3323, 3329, 3331, ...
     3343, 3347, 3359, 3361, 3371, 3373, 3389, 3391, 3407, 3413, ...
     3433, 3449, 3457, 3461, 3463, 3467, 3469, 3491, 3499, 3511, ...
     3517, 3527, 3529, 3533, 3539, 3541, 3547, 3557, 3559, 3571, ...
     3581, 3583, 3593, 3607, 3613, 3617, 3623, 3631, 3637, 3643, ...
     3659, 3671, 3673, 3677, 3691, 3697, 3701, 3709, 3719, 3727, ...
     3733, 3739, 3761, 3767, 3769, 3779, 3793, 3797, 3803, 3821, ...
     3823, 3833, 3847, 3851, 3853, 3863, 3877, 3881, 3889, 3907, ...
     3911, 3917, 3919, 3923, 3929, 3931, 3943, 3947, 3967, 3989, ...
     4001, 4003, 4007, 4013, 4019, 4021, 4027, 4049, 4051, 4057, ...
     4073, 4079, 4091, 4093, 4099, 4111, 4127, 4129, 4133, 4139, ...
     4153, 4157, 4159, 4177, 4201, 4211, 4217, 4219, 4229, 4231, ...
     4241, 4243, 4253, 4259, 4261, 4271, 4273, 4283, 4289, 4297, ...
     4327, 4337, 4339, 4349, 4357, 4363, 4373, 4391, 4397, 4409, ...
     4421, 4423, 4441, 4447, 4451, 4457, 4463, 4481, 4483, 4493, ...
     4507, 4513, 4517, 4519, 4523, 4547, 4549, 4561, 4567, 4583, ...
     4591, 4597, 4603, 4621, 4637, 4639, 4643, 4649, 4651, 4657, ...
     4663, 4673, 4679, 4691, 4703, 4721, 4723, 4729, 4733, 4751, ...
     4759, 4783, 4787, 4789, 4793, 4799, 4801, 4813, 4817, 4831, ...
     4861, 4871, 4877, 4889, 4903, 4909, 4919, 4931, 4933, 4937, ...
     4943, 4951, 4957, 4967, 4969, 4973, 4987, 4993, 4999, 5003, ...
     5009, 5011, 5021, 5023, 5039, 5051, 5059, 5077, 5081, 5087, ...
     5099, 5101, 5107, 5113, 5119, 5147, 5153, 5167, 5171, 5179, ...
     5189, 5197, 5209, 5227, 5231, 5233, 5237, 5261, 5273, 5279, ...
     5281, 5297, 5303, 5309, 5323, 5333, 5347, 5351, 5381, 5387, ...
     5393, 5399, 5407, 5413, 5417, 5419, 5431, 5437, 5441, 5443, ...
     5449, 5471, 5477, 5479, 5483, 5501, 5503, 5507, 5519, 5521, ...
     5527, 5531, 5557, 5563, 5569, 5573, 5581, 5591, 5623, 5639, ...
     5641, 5647, 5651, 5653, 5657, 5659, 5669, 5683, 5689, 5693, ...
     5701, 5711, 5717, 5737, 5741, 5743, 5749, 5779, 5783, 5791, ...
     5801, 5807, 5813, 5821, 5827, 5839, 5843, 5849, 5851, 5857, ...
     5861, 5867, 5869, 5879, 5881, 5897, 5903, 5923, 5927, 5939, ...
     5953, 5981, 5987, 6007, 6011, 6029, 6037, 6043, 6047, 6053, ...
     6067, 6073, 6079, 6089, 6091, 6101, 6113, 6121, 6131, 6133, ...
     6143, 6151, 6163, 6173, 6197, 6199, 6203, 6211, 6217, 6221, ...
     6229, 6247, 6257, 6263, 6269, 6271, 6277, 6287, 6299, 6301, ...
     6311, 6317, 6323, 6329, 6337, 6343, 6353, 6359, 6361, 6367, ...
     6373, 6379, 6389, 6397, 6421, 6427, 6449, 6451, 6469, 6473, ...
     6481, 6491, 6521, 6529, 6547, 6551, 6553, 6563, 6569, 6571, ...
     6577, 6581, 6599, 6607, 6619, 6637, 6653, 6659, 6661, 6673, ...
     6679, 6689, 6691, 6701, 6703, 6709, 6719, 6733, 6737, 6761, ...
     6763, 6779, 6781, 6791, 6793, 6803, 6823, 6827, 6829, 6833, ...
     6841, 6857, 6863, 6869, 6871, 6883, 6899, 6907, 6911, 6917, ...
     6947, 6949, 6959, 6961, 6967, 6971, 6977, 6983, 6991, 6997, ...
     7001, 7013, 7019, 7027, 7039, 7043, 7057, 7069, 7079, 7103, ...
     7109, 7121, 7127, 7129, 7151, 7159, 7177, 7187, 7193, 7207, ...
     7211, 7213, 7219, 7229, 7237, 7243, 7247, 7253, 7283, 7297, ...
     7307, 7309, 7321, 7331, 7333, 7349, 7351, 7369, 7393, 7411, ...
     7417, 7433, 7451, 7457, 7459, 7477, 7481, 7487, 7489, 7499, ...
     7507, 7517, 7523, 7529, 7537, 7541, 7547, 7549, 7559, 7561, ...
     7573, 7577, 7583, 7589, 7591, 7603, 7607, 7621, 7639, 7643, ...
     7649, 7669, 7673, 7681, 7687, 7691, 7699, 7703, 7717, 7723, ...
     7727, 7741, 7753, 7757, 7759, 7789, 7793, 7817, 7823, 7829, ...
     7841, 7853, 7867, 7873, 7877, 7879, 7883, 7901, 7907, 7919, ...
     7927, 7933, 7937, 7949, 7951, 7963, 7993, 8009, 8011, 8017, ...
     8039, 8053, 8059, 8069, 8081, 8087, 8089, 8093, 8101, 8111, ...
     8117, 8123, 8147, 8161, 8167, 8171, 8179, 8191, 8209, 8219, ...
     8221, 8231, 8233, 8237, 8243, 8263, 8269, 8273, 8287, 8291, ...
     8293, 8297, 8311, 8317, 8329, 8353, 8363, 8369, 8377, 8387, ...
     8389, 8419, 8423, 8429, 8431, 8443, 8447, 8461, 8467, 8501, ...
     8513, 8521, 8527, 8537, 8539, 8543, 8563, 8573, 8581, 8597, ...
     8599, 8609, 8623, 8627, 8629, 8641, 8647, 8663, 8669, 8677, ...
     8681, 8689, 8693, 8699, 8707, 8713, 8719, 8731, 8737, 8741, ...
     8747, 8753, 8761, 8779, 8783, 8803, 8807, 8819, 8821, 8831, ...
     8837, 8839, 8849, 8861, 8863, 8867, 8887, 8893, 8923, 8929, ...
     8933, 8941, 8951, 8963, 8969, 8971, 8999, 9001, 9007, 9011, ...
     9013, 9029, 9041, 9043, 9049, 9059, 9067, 9091, 9103, 9109, ...
     9127, 9133, 9137, 9151, 9157, 9161, 9173, 9181, 9187, 9199, ...
     9203, 9209, 9221, 9227, 9239, 9241, 9257, 9277, 9281, 9283, ...
     9293, 9311, 9319, 9323, 9337, 9341, 9343, 9349, 9371, 9377, ...
     9391, 9397, 9403, 9413, 9419, 9421, 9431, 9433, 9437, 9439, ...
     9461, 9463, 9467, 9473, 9479, 9491, 9497, 9511, 9521, 9533, ...
     9539, 9547, 9551, 9587, 9601, 9613, 9619, 9623, 9629, 9631, ...
     9643, 9649, 9661, 9677, 9679, 9689, 9697, 9719, 9721, 9733, ...
     9739, 9743, 9749, 9767, 9769, 9781, 9787, 9791, 9803, 9811, ...
     9817, 9829, 9833, 9839, 9851, 9857, 9859, 9871, 9883, 9887, ...
     9901, 9907, 9923, 9929, 9931, 9941, 9949, 9967, 9973,10007, ...
    10009,10037,10039,10061,10067,10069,10079,10091,10093,10099, ...
    10103,10111,10133,10139,10141,10151,10159,10163,10169,10177, ...
    10181,10193,10211,10223,10243,10247,10253,10259,10267,10271, ...
    10273,10289,10301,10303,10313,10321,10331,10333,10337,10343, ...
    10357,10369,10391,10399,10427,10429,10433,10453,10457,10459, ...
    10463,10477,10487,10499,10501,10513,10529,10531,10559,10567, ...
    10589,10597,10601,10607,10613,10627,10631,10639,10651,10657, ...
    10663,10667,10687,10691,10709,10711,10723,10729,10733,10739, ...
    10753,10771,10781,10789,10799,10831,10837,10847,10853,10859, ...
    10861,10867,10883,10889,10891,10903,10909,10937,10939,10949, ...
    10957,10973,10979,10987,10993,11003,11027,11047,11057,11059, ...
    11069,11071,11083,11087,11093,11113,11117,11119,11131,11149, ...
    11159,11161,11171,11173,11177,11197,11213,11239,11243,11251, ...
    11257,11261,11273,11279,11287,11299,11311,11317,11321,11329, ...
    11351,11353,11369,11383,11393,11399,11411,11423,11437,11443, ...
    11447,11467,11471,11483,11489,11491,11497,11503,11519,11527, ...
    11549,11551,11579,11587,11593,11597,11617,11621,11633,11657, ...
    11677,11681,11689,11699,11701,11717,11719,11731,11743,11777, ...
    11779,11783,11789,11801,11807,11813,11821,11827,11831,11833, ...
    11839,11863,11867,11887,11897,11903,11909,11923,11927,11933, ...
    11939,11941,11953,11959,11969,11971,11981,11987,12007,12011, ...
    12037,12041,12043,12049,12071,12073,12097,12101,12107,12109, ...
    12113,12119,12143,12149,12157,12161,12163,12197,12203,12211, ...
    12227,12239,12241,12251,12253,12263,12269,12277,12281,12289, ...
    12301,12323,12329,12343,12347,12373,12377,12379,12391,12401, ...
    12409,12413,12421,12433,12437,12451,12457,12473,12479,12487, ...
    12491,12497,12503,12511,12517,12527,12539,12541,12547,12553, ...
    12569,12577,12583,12589,12601,12611,12613,12619,12637,12641, ...
    12647,12653,12659,12671,12689,12697,12703,12713,12721,12739, ...
    12743,12757,12763,12781,12791,12799,12809,12821,12823,12829, ...
    12841,12853,12889,12893,12899,12907,12911,12917,12919,12923, ...
    12941,12953,12959,12967,12973,12979,12983,13001,13003,13007, ...
    13009,13033,13037,13043,13049,13063,13093,13099,13103,13109, ...
    13121,13127,13147,13151,13159,13163,13171,13177,13183,13187, ...
    13217,13219,13229,13241,13249,13259,13267,13291,13297,13309, ...
    13313,13327,13331,13337,13339,13367,13381,13397,13399,13411, ...
    13417,13421,13441,13451,13457,13463,13469,13477,13487,13499 ];

  if ( n == -1 )
    p = prime_max;
  elseif ( n == 0 )
    p = 1;
  elseif ( n <= prime_max )
    p = prime_vector(n);
  else
    p = -1;
  end

  return
end
function [ r, seed ] = r8vec_uniform_01 ( n, seed )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_01 returns a unit pseudorandom R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Springer Verlag, pages 201-202, 1983.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, pages 362-376, 1986.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, pages 136-143, 1969.
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real R(N), the vector of pseudorandom values.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  r = zeros ( n, 1 );

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_UNIFORM_01 - Fatal error%\n' );
    fprintf ( 1, '  Input SEED = 0%\n' );
    error ( 'R8VEC_UNIFORM_01 - Fatal error%' );
  end

  for i = 1 : n

    k = floor ( seed / 127773 );

    seed = 16807 * ( seed - k * 127773 ) - k * 2836;

    if ( seed < 0 )
      seed = seed + 2147483647;
    end

    r(i) = seed * 4.656612875E-10;

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

