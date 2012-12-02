function [ qa, qb ] = cube_unit_nd ( func, n, k )

%*****************************************************************************80
%
%% CUBE_UNIT_ND approximates an integral inside the unit cube in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      -1 <= X(1:N) <= 1
%
%  Discussion:
%
%    A K**N point product formula is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Lyness and McHugh,
%    Integration Over Multidimensional Hypercubes, A Progressive Procedure,
%    Computer J,
%    Volume 6, 1963, pages 264-270.
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates the function, of the form
%      function value = func ( n, x )
%
%    Output, real QA(K), QB(K), two sets of estimates for
%    the integral.  The QB entries are obtained from the
%    QA entries by Richardson extrapolation, and QB(K) is
%    the best estimate for the integral.
%
%    Input, integer N, the dimension of the cube.
%
%    Input, integer K, the highest order of integration, and the order
%    of Richardson extrapolation.  K can be no greater than 10.
%
  kmax = 10;

  g( 1, 1) =  1.0E+00;
  g( 2, 1) = -0.3333333333333E+00;
  g( 2, 2) =  0.1333333333333E+01;
  g( 3, 1) =  0.4166666666667E-01;
  g( 3, 2) = -0.1066666666667E+01;
  g( 3, 3) =  0.2025000000000E+01;
  g( 4, 1) = -0.2777777777778E-02;
  g( 4, 2) =  0.3555555555556E+00;
  g( 4, 3) = -0.2603571428571E+01;
  g( 4, 4) =  0.3250793650794E+01;
  g( 5, 1) =  0.1157407407407E-03;
  g( 5, 2) = -0.6772486772487E-01;
  g( 5, 3) =  0.1464508928571E+01;
  g( 5, 4) = -0.5779188712522E+01;
  g( 5, 5) =  0.5382288910935E+01;
  g( 6, 1) = -0.3306878306878E-05;
  g( 6, 2) =  0.8465608465608E-02;
  g( 6, 3) = -0.4881696428571E+00;
  g( 6, 4) =  0.4623350970018E+01;
  g( 6, 5) = -0.1223247479758E+02;
  g( 6, 6) =  0.9088831168831E+01;
  g( 7, 1) =  0.6889329805996E-07;
  g( 7, 2) = -0.7524985302763E-03;
  g( 7, 3) =  0.1098381696429E+00;
  g( 7, 4) = -0.2241624712736E+01;
  g( 7, 5) =  0.1274216124748E+02;
  g( 7, 6) = -0.2516907092907E+02;
  g( 7, 7) =  0.1555944865432E+02;
  g( 8, 1) = -0.1093544413650E-08;
  g( 8, 2) =  0.5016656868509E-04;
  g( 8, 3) = -0.1797351866883E-01;
  g( 8, 4) =  0.7472082375786E+00;
  g( 8, 5) = -0.8168052081717E+01;
  g( 8, 6) =  0.3236023405166E+02;
  g( 8, 7) = -0.5082753227079E+02;
  g( 8, 8) =  0.2690606541646E+02;
  g( 9, 1) =  0.1366930517063E-10;
  g( 9, 2) = -0.2606055516108E-05;
  g( 9, 3) =  0.2246689833604E-02;
  g( 9, 4) = -0.1839281815578E+00;
  g( 9, 5) =  0.3646451822195E+01;
  g( 9, 6) = -0.2588818724133E+02;
  g( 9, 7) =  0.7782965878964E+02;
  g( 9, 8) = -0.1012934227443E+03;
  g( 9, 9) =  0.4688718347156E+02;
  g(10, 1) = -0.1380737896023E-12;
  g(10, 2) =  0.1085856465045E-06;
  g(10, 3) = -0.2222000934334E-03;
  g(10, 4) =  0.3503393934435E-01;
  g(10, 5) = -0.1215483940732E+01;
  g(10, 6) =  0.1456210532325E+02;
  g(10, 7) = -0.7477751530769E+02;
  g(10, 8) =  0.1800771959898E+03;
  g(10, 9) = -0.1998874663788E+03;
  g(10,10) =  0.8220635246624E+02;

  if ( kmax < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CUBE_UNIT_ND - Fatal error!\n' );
    fprintf ( 1, '  K must be no greater than KMAX = %d\n', kmax );
    fprintf ( 1, '  but the input K is %d\n', k );
    error ( 'CUBE_UNIT_ND - Fatal error!' );
  end

  for i = 1 : k
    qa(i) = qmdpt ( func, n, i );
  end
  
  qb(1) = qa(1);

  for i = 2 : k
    qb(i) = g(i,1:i) * qa(1:i)';
  end

  return
end
