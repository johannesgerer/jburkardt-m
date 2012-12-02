function table_quality ( input_filename )

%*****************************************************************************80
%
%% TABLE_QUALITY determines quality measures for a given set of points.
%
%  Discussion:
%
%    This version is set up to handle datasets in the unit hypercube.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger, John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Local parameters:
%
%    Local, integer NDIM, the spatial dimension of the point set.
%
%    Local, integer N, the number of points.
%
%    Local, real Z(NDIM,N), the point set.
%
%    Local, integer NS, the number of sample points.
%
  ns = 100000;
  seed_init = 123456789;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TABLE_QUALITY:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Compute measures of uniform dispersion for a pointset.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Note: this routine assumes that the input pointset\n' );
  fprintf ( 1, '  is contained in the unit hypercube.  If this is not\n' );
  fprintf ( 1, '  the case, then you must rewrite the routine\n' );
  fprintf ( 1, '    SAMPLE_ROUTINE\n' );
  fprintf ( 1, '  so that it properly returns sample points in your\n' );
  fprintf ( 1, '  region, with a uniform density, or a probability\n' );
  fprintf ( 1, '  density of your choosing.\n' );

  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    input_filename = input ( 'Enter the name of the input file, in quotes:  ' );
  end

  [ ndim, n ] = r8mat_header_read ( input_filename );
% 
%  Read the point set.
%
  z = r8mat_data_read ( input_filename, ndim, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TABLE_QUALITY:\n' );
  fprintf ( 1, '  Measures of uniform point dispersion.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The pointset was read from "%s"\n', input_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The sampling routine is "SAMPLE_HYPERCUBE_UNIFORM".\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension NDIM =     %12d\n', ndim );
  fprintf ( 1, '  The number of points N =         %12d\n', n );
  fprintf ( 1, '  The number of sample points NS = %12d\n', ns );
  fprintf ( 1, '  The random number SEED_INIT =    %12d\n', seed_init );
  fprintf ( 1, '\n' );
%
%  For 2 dimensional datasets, some quality measures work from the Delaunay triangulation.
%  Compute that here.
%
  if ( ndim == 2 )

    triangle = delaunay ( z(1,1:n), z(2,1:n) );

    triangle = triangle';
    [ dummy, nt ] = size ( triangle );

  else

    triangle = [];
    nt = 0;

  end

  if ( ndim == 2 )
    fprintf ( 1, '  The minimum angle measure    Alpha = %14f\n', ...
      alpha_measure ( n, z, 3, nt, triangle ) );
    fprintf ( 1, '  The area ratio measure        Area = %14f\n', ...
      area_measure ( n, z, 3, nt, triangle ) );
  else
    fprintf ( 1, '  The minimum angle measure    Alpha = (omitted)\n' );
    fprintf ( 1, '  The area ratio measure        Area = (omitted)\n' );
  end
  fprintf ( 1, '  Relative spacing deviation    BETA = %14f\n', ...
    lambda_measure ( ndim, n, z ) );
  fprintf ( 1, '  The regularity measure         Chi = %14f\n', ...
    chi_measure ( ndim, n, z, ns, 'sample_hypercube_uniform', seed_init ) );
  fprintf ( 1, '  2nd moment determinant measure   D = %14e\n', ...
    d_measure ( ndim, n, z, ns, 'sample_hypercube_uniform', seed_init ) );
  fprintf ( 1, '  The Voronoi energy measure       E = %14f\n', ...
    e_measure ( ndim, n, z, ns, 'sample_hypercube_uniform', seed_init ) );
  fprintf ( 1, '  The mesh ratio               Gamma = %14f\n', ...
    gamma_measure ( ndim, n, z ) );
  fprintf ( 1, '  The point distribution norm      H = %14f\n', ...
    h_measure ( ndim, n, z, ns, 'sample_hypercube_uniform', seed_init ) );
  fprintf ( 1, '  The COV measure             Lambda = %14f\n', ...
    lambda_measure ( ndim, n, z ) );
  fprintf ( 1, '  The point distribution ratio    Mu = %14f\n', ...
    mu_measure ( ndim, n, z, ns, 'sample_hypercube_uniform', seed_init ) );
  fprintf ( 1, '  The cell volume deviation       Nu = %14f\n', ...
    nu_measure ( ndim, n, z, ns, 'sample_hypercube_uniform', seed_init ) );
  if ( ndim == 2 )
    fprintf ( 1, '  The triangle uniformity measure  Q = %14f\n', ...
      q_measure ( n, z, 3, nt, triangle ) );
  else
    fprintf ( 1, '  The triangle uniformity measure  Q = (omitted)\n' );
  end
  fprintf ( 1, '  The Riesz S = 0 energy measure  R0 = %14f\n', ...
    r0_measure ( ndim, n, z ) );
  if ( r8mat_in_01 ( ndim, n, z ) )
    fprintf ( 1, '  Nonintersecting sphere volume    S = %14f\n', ...
      sphere_measure ( ndim, n, z ) );
  else
    fprintf ( 1, '  Nonintersecting sphere volume    S = (omitted)\n' );
  end
  fprintf ( 1, '  2nd moment trace measure       Tau = %14f\n', ...
    tau_measure ( ndim, n, z, ns, 'sample_hypercube_uniform', seed_init ) );

  gamma = pointset_spacing ( ndim, n, z );

  gamma_min = min ( gamma(1:n) );
  gamma_max = max ( gamma(1:n) );

  gamma_ave = sum ( gamma(1:n) ) / n;

  if ( 1 < n )
    gamma_std = sqrt ( sum ( ( gamma(1:n) - gamma_ave ).^2 )  / ( n - 1 ) );
  else
    gamma_std = 0.0;
  end

  fprintf ( 1, '\n');
  fprintf ( 1, '  Minimum spacing          GAMMA_MIN = %f\n', gamma_min );
  fprintf ( 1, '  Average spacing          GAMMA_AVE = %f\n', gamma_ave );
  fprintf ( 1, '  Maximum spacing          GAMMA_MAX = %f\n', gamma_max );
  fprintf ( 1, '  Spacing standard dev     GAMMA_STD = %f\n', gamma_std );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TABLE_QUALITY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function alpha = alpha_measure ( n, z, triangle_order, triangle_num, ...
  triangle_node )

%*****************************************************************************80
%
%% ALPHA_MEASURE determines the triangulated pointset quality measure Q.
%
%  Discusion:
%
%    The ALPHA measure evaluates the uniformity of the shapes of the triangles
%    defined by a triangulated pointset.
%
%    This measure is naturally extended to higher dimensions, but the
%    given program can only handle DIM_NUM = 2.
%
%    We measure the minimum angle among all the triangles in the triangulated dataset.  
%    In degrees, the maximum possible value is 60.  We divide the achieved value by
%    the maximum possible value to get a quality measure.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), the triangulation.
%
%    Output, real ALPHA_MEASURE, the ALPHA quality measure.
%
  alpha = r8_huge ( );

  for triangle = 1 : triangle_num

    a_index = triangle_node(1,triangle);
    b_index = triangle_node(2,triangle);
    c_index = triangle_node(3,triangle);

    a_x = z(1,a_index);
    a_y = z(2,a_index);
    b_x = z(1,b_index);
    b_y = z(2,b_index);
    c_x = z(1,c_index);
    c_y = z(2,c_index);

    ab_len = sqrt ( ( a_x - b_x )^2 + ( a_y - b_y )^2 );
    bc_len = sqrt ( ( b_x - c_x )^2 + ( b_y - c_y )^2 );
    ca_len = sqrt ( ( c_x - a_x )^2 + ( c_y - a_y )^2 );
%
%  Take care of a ridiculous special case.
%
    if ( ab_len == 0.0 & bc_len == 0.0 & ca_len == 0.0 )
      a_angle = 2.0 * pi / 3.0;
      b_angle = 2.0 * pi / 3.0;
      c_angle = 2.0 * pi / 3.0;
    else

      if ( ca_len == 0.0 | ab_len == 0.0 )
        a_angle = pi;
      else
        a_angle = arc_cosine ( ( ca_len^2 + ab_len^2 - bc_len^2 ) ...
          / ( 2.0 * ca_len * ab_len ) );
      end

      if ( ab_len == 0.0 | bc_len == 0.0 )
        b_angle = pi;
      else
        b_angle = arc_cosine ( ( ab_len^2 + bc_len^2 - ca_len^2 ) ...
          / ( 2.0 * ab_len * bc_len ) );
      end

      if ( bc_len == 0.0 | ca_len == 0.0 )
        c_angle = pi;
      else
        c_angle = arc_cosine ( ( bc_len^2 + ca_len^2 - ab_len^2 ) ...
          / ( 2.0 * bc_len * ca_len ) );
      end

    end

    alpha = min ( alpha, a_angle );
    alpha = min ( alpha, b_angle );
    alpha = min ( alpha, c_angle );

  end
%
%  Convert to a quality measure in [0,1].
%
  alpha = alpha * 3.0 / pi;

  return
end
function value = arc_cosine ( c )

%*****************************************************************************80
%
%% ARC_COSINE computes the arc cosine function, with argument truncation.
%
%  Discussion:
%
%    If you call your system ACOS routine with an input argument that is
%    even slightly outside the range [-1.0, 1.0 ], you may get an unpleasant 
%    surprise (I did).
%
%    This routine simply truncates arguments outside the range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real C, the argument.
%
%    Output, real VALUE, an angle whose cosine is C.
%
  c2 = c;
  c2 = max ( c2, -1.0 );
  c2 = min ( c2, +1.0 );

  value = acos ( c2 );

  return
end
function value = area_measure ( n, z, triangle_order, triangle_num, ...
  triangle_node )

%*****************************************************************************80
%
%% AREA_MEASURE determines the area ratio quality measure.
%
%  Discusion:
%
%    This measure computes the area of every triangle, and returns
%    the ratio of the minimum to the maximum triangle.  A value of
%    1 is "perfect", indicating that all triangles have the same area.
%    A value of 0 is the worst possible result.
%
%    The code has been modified to 'allow' 6-node triangulations.
%    However, no effort is made to actually process the midside nodes.
%    Only information from the vertices is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real Z(2,N), the points.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM),
%    the triangulation.
%
%    Output, real VALUE, the AREA quality measure.
%
  area_max = 0.0;
  area_min = r8_huge ( );

  for triangle = 1 : triangle_num

    x1 = z(1,triangle_node(1,triangle));
    y1 = z(2,triangle_node(1,triangle));
    x2 = z(1,triangle_node(2,triangle));
    y2 = z(2,triangle_node(2,triangle));
    x3 = z(1,triangle_node(3,triangle));
    y3 = z(2,triangle_node(3,triangle));

    area = 0.5 * abs ( x1 * ( y2 - y3 ) ...
                    + x2 * ( y3 - y1 ) ...
                    + x3 * ( y1 - y2 ) );

    area_min = min ( area_min, area );
    area_max = max ( area_max, area );

  end

  if ( 0.0 < area_max )
    value = area_min / area_max;
  else
    value = 0.0;
  end

  return
end
function chi = chi_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% CHI_MEASURE determines the pointset quality measure CHI.
%
%  Discussion:
%
%    The CHI measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%    Assign every point X in the region to the nearest element
%    Z(I) of the point set.  For each Z(I), let H(I) be the maximum
%    distance between Z(I) and any point assigned to it by this process.
%
%    For each point Z(I), we determine the nearest distinct element of
%    the pointset by
%
%      GAMMA(I) = minimum ( 1 <= J <= N, I /= J ) distance ( Z(I), Z(J) )
%
%    Then
%
%      CHI(I) = 2 * H(I) / GAMMA(I)
%
%    and
%
%      CHI = maximum ( 1 <= I <= N ) CHI(I)
%
%    This quantity can be estimated by using sampling to pick a large
%    number of points in the region, rather than all of them.
%
%    For an ideally regular mesh, all the CHI(I)'s will be equal.
%    Any deviation from regularity increases the value of some entries
%    of CHI; thus, given two meshes, the one with a lower value of
%    CHI is to be recommended.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2004
%
%  Author:
%
%    Max Gunzburger
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real ( kind = 8 ) Z(DIM_NUM,N), the points.
%
%    Input, integer NS, the number of sample points.
%
%    Input, character SAMPLE_ROUTINE, the name of the function to be used to
%    return sample points in the region.  The function must have the form
%      [ x, seed ] = sample_routine ( dim_num, n, seed )
%
%    Input, integer SEED_INIT, the initial value of the random number seed.
%
%    Output, real CHI, the CHI quality measure.
%
  seed = seed_init;
  h(1:n) = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    dist = sum ( ( x(1:dim_num) - z(1:dim_num,closest(1)) ).^2 );

    h(closest(1)) = max ( h(closest(1)), dist );

  end

  gamma = pointset_spacing ( dim_num, n, z );

  chi_vec(1:n) = 2.0 * sqrt ( h(1:n) ) ./ gamma(1:n);

  chi = max ( chi_vec(1:n) );

  return
end
function d = d_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% D_MEASURE determines the pointset quality measure D.
%
%  Discussion:
%
%    The D measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%    For each point Z(I) in the pointset, let V(I) be the subregion
%    defined by the intersection of the region with the Voronoi
%    region associated with Z(I).
%
%    Let D(I) be the determinant of the deviatoric tensor associated with
%    the region V(I).
%
%    Then D = maximum ( 1 <= I <= N ) D(I).
%
%    This quantity can be estimated using sampling.  A given number of
%    sample points are generated in the region, assigned to the nearest
%    element of the pointset, and used to approximate the Voronoi regions
%    and the deviatoric tensors.
%
%    In an ideally regular mesh, each deviatoric tensor would have a
%    zero determinant, and hence D would be zero.  In general, the smaller
%    D, the better.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer NS, the number of sample points.
%
%    Input, character SAMPLE_ROUTINE, the name of the function to be used to
%    return sample points in the region.  The function must have the form
%      [ x, seed ] = sample_routine ( dim_num, n, seed )
%
%    Input, integer SEED_INIT, the initial value of the random number seed.
%
%    Output, real D, the D quality measure.
%
  seed = seed_init;
  centroid(1:dim_num,1:n) = 0.0;
  hit(1:n) = 0;
  moment(1:dim_num,1:dim_num,1:n) = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    hit(closest(1)) = hit(closest(1)) + 1;

    centroid(1:dim_num,closest(1)) = centroid(1:dim_num,closest(1)) + x(1:dim_num);

    for i1 = 1 : dim_num
      for i2 = 1 : dim_num
        moment(i1,i2,closest(1)) = moment(i1,i2,closest(1)) + x(i1) * x(i2);
      end
    end

  end

  for j = 1 : n

    if ( 0 < hit(j) )

      centroid(1:dim_num,j) = centroid(1:dim_num,j) / hit(j);

      moment(1:dim_num,1:dim_num,j) = moment(1:dim_num,1:dim_num,j) / hit(j);

      for i1 = 1 : dim_num
        for i2 = 1 : dim_num
          moment(i1,i2,j) = moment(i1,i2,j) - centroid(i1,j) * centroid(i2,j);
        end
      end

    end

  end

  tri(1:n) = 0.0;

  for j = 1 : n
    for i = 1 : dim_num
      tri(j) = tri(j) + moment(i,i,j);
    end
  end

  for j = 1 : n
    for i = 1 : dim_num
      moment(i,i,j) = moment(i,i,j) - tri(j) / dim_num;
    end
  end

  d = 0.0;

  for j = 1 : n

    di = dge_det ( dim_num, moment(1:dim_num,1:dim_num,j) );

    d = max ( d, di );

  end

  return
end
function det = dge_det ( n, a )

%*****************************************************************************80
%
%% DGE_DET computes the determinant of a square matrix in DGE storage.
%
%  Discussion:
%
%    The DGE storage format is used for a general M by N matrix.  A storage
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A(N,N), the matrix to be analyzed.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0;

  for k = 1 : n-1
%
%  Find L, the index of the pivot row.
%
    l = k;
    for i = k+1 : n
      if ( abs ( a(l,k) ) < abs ( a(i,k) ) )
        l = i;
      end
    end

    det = det * a(l,k);
%
%  Interchange rows L and K if necessary.
%
    if ( l ~= k )
      t      = a(l,k);
      a(l,k) = a(k,k);
      a(k,k) = t;
    end
%
%  Normalize the values that lie below the pivot entry A(K,K).
%
    a(k+1:n,k) = -a(k+1:n,k) / a(k,k);
%
%  Row elimination with column indexing.
%
    for j = k+1 : n

      if ( l ~= k )
        t      = a(l,j);
        a(l,j) = a(k,j);
        a(k,j) = t;
      end

      a(k+1:n,j) = a(k+1:n,j) + a(k+1:n,k) * a(k,j);

    end

  end

  det = det * a(n,n);

  return
end
function e = e_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% E_MEASURE determines the pointset quality measure E.
%
%  Discussion:
%
%    The E measure of point distribution quality for a set Z of
%    N points in an DIM_NUM dimensional region is defined as follows:
%
%    Assign every point X in the region to the nearest element
%    Z(I) of the point set.  For each point Z(I), let E_VEC(I) be the
%    integral of the distance between Z(I) and all the points assigned to
%    it:
%
%      E_VEC(I) = Integral ( all X nearest to Z(I) ) distance ( X, Z(I) )
%
%    If we let VOLUME be the volume of the region, then we define E by:
%
%      E = sum ( 1 <= I <= N ) E_VEC(I) / VOLUME
%
%    This quantity can be estimated by using sampling to pick a large
%    number of points in the region, rather than all of them.
%
%    The E measure is minimized by a centroidal Voronoi tessellation.
%
%    Given two meshes, the one with a lower value of E is to be recommended.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real ( kind = 8 ) Z(DIM_NUM,N), the points.
%
%    Input, integer NS, the number of sample points.
%
%    Input, character SAMPLE_ROUTINE, the name of the function to be used to
%    return sample points in the region.  The function must have the form
%      [ x, seed ] = sample_routine ( dim_num, n, seed )
%
%    Input, integer SEED_INIT, the initial value of the random number seed.
%
%    Output, real E, the E quality measure.
%
  seed = seed_init;
  e_vec(1:n) = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    dist = sum ( ( x(1:dim_num) - z(1:dim_num,closest(1)) ).^2 );

    e_vec(closest(1)) = e_vec(closest(1)) + dist;

  end

  e = sum ( e_vec(1:n) ) / ns;

  return
end
function column_num = file_column_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_COLUMN_COUNT counts the columns in the first line of a file.
%
%  Discussion:
%
%    The file is assumed to be a simple text file.
%
%    Most lines of the file are presumed to consist of COLUMN_NUM words,
%    separated by spaces.  There may also be some blank lines, and some 
%    comment lines, which have a "#" in column 1.
%
%    The routine tries to find the first non-comment non-blank line and
%    counts the number of words in that line.
%
%    If all lines are blanks or comments, it goes back and tries to analyze
%    a comment line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the file.
%
%    Output, integer COLUMN_NUM, the number of columns in the file.
%
  FALSE = 0;
  TRUE = 1;
%
%  Open the file.
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_COLUMN_COUNT - Error!' );
  end
%
%  Read one line, but skip blank lines and comment lines.
%  Use FGETL so we drop the newline character!
%
  got_one = FALSE;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( s_len_trim ( line ) == 0 )

    elseif ( line(1) == '#' )

    else
      got_one = TRUE;
      break;
    end

  end

  fclose ( input_unit );

  if ( got_one == FALSE ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Warning!\n' );
    fprintf ( 1, '  The file does not seem to contain any data.\n' );
    column_num = -1;
    return
  end

  column_num = s_word_count ( line );

  return
end
function row_num = file_row_count ( input_file_name )

%*****************************************************************************80
%
%% FILE_ROW_COUNT counts the number of row records in a file.
%
%  Discussion:
%
%    Each input line is a "RECORD".
%
%    The records are divided into three groups:
%    
%    * BLANK LINES (nothing but blanks)
%    * COMMENT LINES (begin with a '#')
%    * DATA RECORDS (anything else)
%
%    The value returned by the function is the number of data records.
%
%    By the way, if the MATLAB routine FGETS is used, instead of
%    FGETL, then the variable LINE will include line termination 
%    characters, which means that a blank line would not actually
%    have zero characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Output, integer ROW_NUM, the number of rows found. 
%
  input_unit = fopen ( input_file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_ROW_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_ROW_COUNT - Error!' );
  end

  blank_num = 0;
  comment_num = 0;
  row_num = 0;
  
  record_num = 0;

  while ( 1 )

    line = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    record_num = record_num + 1;
    record_length = s_len_trim ( line );
    
    if ( record_length <= 0 )
      blank_num = blank_num + 1;
    elseif ( line(1) == '#' )
      comment_num = comment_num + 1;
    else
      row_num = row_num + 1;
    end

  end

  fclose ( input_unit );

  return
end
function nearest = find_closest ( dn, gn, sn, s, g )

%*****************************************************************************80
%
%% FIND_CLOSEST finds the nearest G point to each S point.
%
%  Discussion:
%
%    Given two sets of points G and S, this function finds, for every
%    s in S, the index of the closest point g in G.
%
%    This procedure would seem to naturally require GN * SN operations,
%    and that is how this function is programmed.  However, for large
%    datasets, this cost can be prohibitive, and there are procedures
%    for preprocessing the dataset G that can greatly reduce this cost.
%
%    Modified in accordance with suggestions by Gene Cliff, 08 July 2010.
%
%    Modified yet again to deal with the special case of DN = 1,
%    15 September 2010.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DN, the spatial dimension.
%
%    Input, integer GN, the number of cell generators.
%
%    Input, integer SN, the number of sample points.
%
%    Input, real S(DN,SN), the points to be checked.
%
%    Input, real G(DN,GN), the cell generators.
%
%    Output, integer NEAREST(SN), the index of the cell generator nearest
%    to the sample point.
%
  ones_k = ones ( 1, gn );
  nearest = NaN ( 1, sn );

  for i = 1 : sn
    d1(1:dn,1:gn) = g(1:dn,1:gn) - s(1:dn,i) * ones_k;
    d2 = sum ( d1 .* d1, 1 );
    [ min_val, min_loc ] = min ( d2 );
    nearest(i) = min_loc;
  end

  return
end
function gamma = gamma_measure ( dim_num, n, z )

%*****************************************************************************80
%
%% GAMMA_MEASURE determines the pointset quality measure GAMMA.
%
%  Discussion:
%
%    The GAMMA measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%      GAMMA = ( GAMMA_MAX / GAMMA_MIN ),
%
%    where
%
%      GAMMA_MAX = maximum ( 1 <= I <= N ) DIST_MIN(I)
%      GAMMA_MIN = minimum ( 1 <= I <= N ) DIST_MIN(I)
%
%    and
%
%      DIST_MIN(I) = minimum ( 1 <= J <= N, I /= J ) distance ( Z(I), Z(J) )
%
%    Note that, in this code, the variable DIST_SQ_MIN is actually the square
%    of the minimum point distance, and so when we compute GAMMA, we must
%    take the square root of the given ratio.
%
%    GAMMA must be at least 1.  For an ideally regular mesh, GAMMA would
%    be equal to one.  Given two meshes, this measure recommends the one
%    with the smaller value of GAMMA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Output, real GAMMA, the GAMMA quality measure.
%
%  Local parameters:
%
%    Local, real ( kind = 8 ) GAMMA_SQ_MAX, the maximum, over all points,
%    of the minimum squared distance to a distinct point.
%
%    Local, real ( kind = 8 ) GAMMA_SQ_MIN, the minimum, over all points,
%    of the minimum squared distance to a distinct point.
%

%
%  Take care of ridiculous cases.
%
  if ( n <= 1 )
    gamma = 0.0;
    return
  end

  gamma_sq_max = 0.0;
  gamma_sq_min = r8_huge ( );

  for j1 = 1 : n

    dist_sq_min = r8_huge ( );

    for j2 = 1 : n

      if ( j2 ~= j1 )
        dist_sq = sum ( ( z(1:dim_num,j1) - z(1:dim_num,j2) ).^2 );
        if ( dist_sq < dist_sq_min )
          dist_sq_min = dist_sq;
        end
      end

    end

    gamma_sq_max = max ( gamma_sq_max, dist_sq_min );
    gamma_sq_min = min ( gamma_sq_min, dist_sq_min );

  end

  if ( gamma_sq_min <= 0.0 )
    gamma = r8_huge ( );
  else
    gamma = sqrt ( gamma_sq_max / gamma_sq_min );
  end

  return
end
function h = h_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% H_MEASURE determines the pointset quality measure H.
%
%  Discussion:
%
%    The H measure of dispersion for a set of N points in an DIM_NUM-dimensional
%    region is the maximum distance between a point in the region and 
%    some point in the set.
%
%    To compute this quantity exactly, for every point X in the region,
%    find the nearest element Z of the point set and compute the distance.
%    H is then the maximum of all these distances.
%
%    To ESTIMATE this quantity, carry out the same process, but only for
%    NS sample points in the region.
%
%    Under this measure, a mesh with a smaller value of H is preferable.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer NS, the number of sample points.
%
%    Input, character SAMPLE_ROUTINE, the name of the function to be used to
%    return sample points in the region.  The function must have the form
%      [ x, seed ] = sample_routine ( dim_num, n, seed )
%
%    Input, integer SEED_INIT, the initial value of the random number seed.
%
%    Output, real H, the H quality measure.
%
  seed = seed_init;
  h = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    dist = sum ( ( x(1:dim_num) - z(1:dim_num,closest(1)) ).^2 );

    h = max ( h, dist );

  end

  h = sqrt ( h );

  return
end
function lambda = lambda_measure ( dim_num, n, z )

%*****************************************************************************80
%
%% LAMBDA_MEASURE determines the pointset quality measure LAMBDA.
%
%  Discussion:
%
%    The LAMBDA measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%    Let
%
%      GAMMA(I) = minimum ( 1 <= J <= N, I /= J ) distance ( Z(I), Z(J) )
%
%    and let
%
%      GAMMA_AVE = sum ( 1 <= I <= N ) GAMMA(I) / N
%
%    then
%
%      LAMBDA = sqrt ( sum ( 1 <= I <= N ) ( GAMMA(I) - GAMMA_AVE )**2 / N )
%        / GAMMA_AVE
%
%    An ideally regular mesh would have GAMMA(I) = GAMMA_AVE for all I,
%    so that LAMBDA would be 0.  Under this measure, the mesh with the
%    smaller value of LAMBDA is to be preferred.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2004
%
%  Author:
%
%    Max Gunzburger
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Output, real LAMBDA, the LAMBDA quality measure.
%
%  Local parameters:
%
%    Local, real GAMMA_MAX, the maximum, over all points,
%    of the minimum distance to a distinct point.
%
%    Local, real GAMMA_MIN, the minimum, over all points,
%    of the minimum distance to a distinct point.
%

%
%  Take care of ridiculous cases.
%
  if ( n <= 1 )
    lambda = 0.0;
    return
  end
%
%  Compute the minimum spacing between distinct points of the set.
%
  gamma = pointset_spacing ( dim_num, n, z );
%
%  Average the minimum spacing.
%
  gamma_ave = sum ( gamma(1:n) ) / n;
%
%  Compute a weighted variance.
%
  if ( gamma_ave <= 0.0 )
    lambda = r8_huge ( );
  else
    lambda = sqrt ( sum ( ( gamma(1:n) - gamma_ave ).^2 ) / n ) / gamma_ave;
  end

  return
end
function mu = mu_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% MU_MEASURE determines the pointset quality measure MU.
%
%  Discussion:
%
%    The MU measure of dispersion for a set of N points in an
%    DIM_NUM-dimensional region takes the ratio of the largest and
%    smallest half-diameters of the Voronoi cells defined by a pointset.
%
%    To compute this quantity exactly, for every point X in the region,
%    find the nearest element Z of the point set and compute the distance.
%
%    Then, for each element Z(I) of the point set, define H(I) to be the
%    maximum of these distances.
%
%    MU is then the ratio of the maximum and minimum values of H.
%
%    To ESTIMATE this quantity, carry out the same process, but only for
%    NS sample points in the region.
%
%    In an ideally regular mesh, MU would be 1.  MU must be at least 1.
%    Under this measure, the mesh with the smaller value of MU is to be
%    preferred.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer NS, the number of sample points.
%
%    Input, character SAMPLE_ROUTINE, the name of the function to be used to
%    return sample points in the region.  The function must have the form
%      [ x, seed ] = sample_routine ( dim_num, n, seed )
%
%    Input, integer SEED_INIT, the initial value of the random number seed.
%
%    Output, real MU, the MU quality measure.
%
  seed = seed_init;
  h(1:n) = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    dist = sum ( ( x(1:dim_num) - z(1:dim_num,closest(1)) ).^2 );

    h(closest(1)) = max ( h(closest(1)), dist );

  end

  h_max = sqrt ( max ( h(1:n) ) );
  h_min = sqrt ( min ( h(1:n) ) );

  if ( h_min == 0.0 )
    mu = r8_huge ( );
  else
    mu = h_max / h_min;
  end

  return
end
function nu = nu_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% NU_MEASURE determines the pointset quality measure NU.
%
%  Discussion:
%
%    The NU measure of dispersion for a set of N points in an
%    DIM_NUM-dimensional region is defined as follows:
%
%    For each element Z(I) of the pointset, let VOLUME(I) be the volume
%    of the corresponding Voronoi region, restricted to the region.
%
%    Then
%
%      NU = max ( 1 <= I <= N ) VOLUME(I) / min ( 1 <= I <= N ) VOLUME(I)
%
%    This quantity can be estimated by using a large number of sampling
%    points to estimate the Voronoi volumes.
%
%    For an ideally uniform pointset, the Voronoi volumes would be equal,
%    so that NU would be 1.  In any case, NU must be 1 or greater.  In
%    comparing two meshes, the one with the lower value of NU would be
%    preferred.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer NS, the number of sample points.
%
%    Input, character SAMPLE_ROUTINE, the name of the function to be used to
%    return sample points in the region.  The function must have the form
%      [ x, seed ] = sample_routine ( dim_num, n, seed )
%
%    Input, integer SEED_INIT, the initial value of the random number seed.
%
%    Output, NU, the NU quality measure.
%
  seed = seed_init;
  hit(1:n) = 0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    hit(closest(1)) = hit(closest(1)) + 1;

  end

  volume(1:n) = hit(1:n) / ns;

  if ( min ( volume(1:n) ) == 0.0 )
    nu = r8_huge ( );
  else
    nu = max ( volume(1:n) ) / min ( volume(1:n) );
  end

  return
end
function gamma = pointset_spacing ( dim_num, n, z )

%*****************************************************************************80
%
%% POINTSET_SPACING determines the minimum spacing between points in the set.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the point distribution.
%
%    Output, real GAMMA(N), the minimum distance between each
%    point and a distinct point in the set.
%
  gamma(1:n) = r8_huge ( );

  for j1 = 1 : n

    for j2 = 1 : n

      if ( j2 ~= j1 )
        gamma(j1) = min ( gamma(j1), ...
          sum ( ( z(1:dim_num,j1) - z(1:dim_num,j2) ).^2 ) );
      end

    end

  end

  gamma(1:n) = sqrt ( gamma(1:n) );

  return
end
function value = q_measure ( n, z, triangle_order, triangle_num, triangle_node )

%*****************************************************************************80
%
%% Q_MEASURE determines the triangulated pointset quality measure Q.
%
%  Discussion:
%
%    The Q measure evaluates the uniformity of the shapes of the triangles
%    defined by a triangulated pointset.
%
%    For a single triangle T, the value of Q(T) is defined as follows:
%
%      TAU_IN = radius of the inscribed circle,
%      TAU_OUT = radius of the circumscribed circle,
%
%      Q(T) = 2 * TAU_IN / TAU_OUT
%        = ( B + C - A ) * ( C + A - B ) * ( A + B - C ) / ( A * B * C )
%
%    where A, B and C are the lengths of the sides of the triangle T.
%
%    The Q measure computes the value of Q(T) for every triangle T in the
%    triangulation, and then computes the standard deviation of this
%    set of values:
%
%      Q_MEASURE = min ( all T in triangulation ) Q(T)
%
%    In an ideally regular mesh, all triangles would have the same
%    equilateral shape, for which Q = 1.  In a good mesh, 0.5 < Q.
%
%    Given the 2D coordinates of a set of N nodes, stored as Z(1:2,1:N),
%    a triangulation is a list of NT triples of node indices that form
%    triangles.  Generally, a maximal triangulation is expected, namely,
%    a triangulation whose image is a planar graph, but for which the
%    addition of any new triangle would mean the graph was no longer planar.
%    A Delaunay triangulation is a maximal triangulation which maximizes
%    the minimum angle that occurs in any triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, pages 329-345, June 2004.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer TRIANGLE_ORDER, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), the triangulation.
%
%    Output, real VALUE, the Q quality measure.
%
  if ( triangle_num < 1 )
    value = -1.0;
    return
  end
%
%  Compute the mean value of Q.
%
  q_min = r8_huge ( );

  for triangle = 1 : triangle_num

    a_index = triangle_node(1,triangle);
    b_index = triangle_node(2,triangle);
    c_index = triangle_node(3,triangle);

    ab_length = sqrt ( ...
        ( z(1,a_index) - z(1,b_index) )^2 ...
      + ( z(2,a_index) - z(2,b_index) )^2 );

    bc_length = sqrt ( ...
        ( z(1,b_index) - z(1,c_index) )^2 ...
      + ( z(2,b_index) - z(2,c_index) )^2 );

    ca_length = sqrt ( ...
        ( z(1,c_index) - z(1,a_index) )^2 ...
      + ( z(2,c_index) - z(2,a_index) )^2 );

    q = ( bc_length + ca_length - ab_length ) ...
      * ( ca_length + ab_length - bc_length ) ...
      * ( ab_length + bc_length - ca_length ) ...
      / ( ab_length * bc_length * ca_length );

    q_min = min ( q_min, q );

  end

  value = q_min;

  return
end
function value = r0_measure ( dim_num, n, z )

%*****************************************************************************80
%
%% R0_MEASURE determines the pointset quality measure R0.
%
%  Discussion:
%
%    The R0 measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%      R0 = sum ( 1 <= I /= J <= N ) log ( 1 / distance ( Z(I), Z(J) ) )
%         / ( N * ( N - 1 ) )
%
%    The divisor of ( N * ( N - 1 ) ) means that R0 is essentially an
%
%    R0 is undefined if N < 2 or if any two points are equal.
%
%    R0 is known as the Riesz S-energy for S = 0.
%
%    Given two meshes, this measure recommends the one with the smaller
%    value of R0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    D P Hardin, E B Saff,
%    Discretizing Manifolds via Minimum Energy Points,
%    Notices of the AMS,
%    Volume 51, Number 10, November 2004, pages 1186-1194.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Output, real VALUE, the R0 quality measure.
%

%
%  Take care of ridiculous cases.
%
  if ( n <= 1 )
    value = r8_huge ( );
    return
  end

  value = 0.0;

  for j1 = 1 : n

    for j2 = 1 : n

      if ( j2 ~= j1 )

        dist = sqrt ( sum ( ( z(1:dim_num,j1) - z(1:dim_num,j2) ).^2 ) );

        if ( dist == 0.0 )
          value = r8_huge ( )
          return
        end

        value = value + log ( 1.0 / dist );

      end

    end

  end

  value = value / ( n * ( n - 1 ) );

  return
end
function value = r8_huge ( )

%*****************************************************************************80
%
%% R8_HUGE returns a "huge" real number.
%
%  Discussion:
%
%    The value returned by this function is NOT required to be the
%    maximum representable R8.  This value varies from machine to machine,
%    from compiler to compiler, and may cause problems when being printed.
%    We simply want a "very large" but non-infinite number.
%
%    MATLAB provides a built-in symbolic constant "inf" that can be used
%    if a huge number is really what you want!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, a huge number.
%
  value = 1.0E+30;

  return
end
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns of data.
%
%    Output, real TABLE(M,N), the point coordinates.
%

%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %f' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8MAT_DATA_READ - Error!' );
  end

  table = zeros(m,n);

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function [ m, n ] = r8mat_header_read ( input_filename )

%*****************************************************************************80
%
%% R8MAT_HEADER_READ reads the header from an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, integer M, the spatial dimension.
%
%    Output, integer N, the number of points.
%
  m = file_column_count ( input_filename );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
  end

  n = file_row_count ( input_filename );

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
  end

  return
end
function value = r8mat_in_01 ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_IN_01 is TRUE if the entries of an R8MAT are in the range [0,1].
%
%  Modified:
%
%    06 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the matrix.
%
%    Output, logical VALUE, is TRUE if every entry of A is
%    between 0 and 1.
%
  if ( any ( a(1:m,1:n) < 0.0 | 1.0 < a(1:m,1:n) ) )
    value = 0;
  else
    value = 1;
  end

  return
end
function [ r, seed ] = r8mat_uniform_01 ( m, n, seed )

%*****************************************************************************80
%
%% R8MAT_UNIFORM_01 returns a unit pseudorandom R8MAT.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Second Edition,
%    Springer, 1987,
%    ISBN: 0387964673,
%    LC: QA76.9.C65.B73.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, December 1986, pages 362-376.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998,
%    ISBN: 0471134031,
%    LC: T57.62.H37.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, Number 2, 1969, pages 136-143.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, integer SEED, the integer "seed" used to generate
%    the output random number.
%
%    Output, real R(M,N), an array of random values between 0 and 1.
%
%    Output, integer SEED, the updated seed.  This would
%    normally be used as the input seed on the next call.
%
  r = zeros ( m, n );

  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8MAT_UNIFORM_01 - Fatal error!' );
  end

  for j = 1 : n
    for i = 1 : m

      seed = floor ( seed );

      seed = mod ( seed, i4_huge );

      if ( seed < 0 ) 
        seed = seed + i4_huge;
      end 

      k = floor ( seed / 127773 );

      seed = 16807 * ( seed - k * 127773 ) - k * 2836;

      if ( seed < 0 )
        seed = seed + i4_huge;
      end

      r(i,j) = seed * 4.656612875E-10;

    end
  end

  return
end
function radius = radius_maximus ( dim_num, n, z, walls )

%*****************************************************************************80
%
%% RADIUS_MAXIMUS finds the biggest possible nonintersecting sphere.
%
%  Discussion:
%
%    We are given a set of N points in DIM_NUM space.  We imagine that
%    at each point simultaneously, a sphere begins to expand.
%    Each sphere stops expanding as soon as it touches another sphere.
%    The radius of these spheres is to be computed.
%
%    If WALLS is true, then the spheres must not extend outside the
%    "walls" of the unit hypersquare.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the number of spatial dimensions.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the point coordinates.
%    If WALLS is TRUE, these values must be between 0 and 1.
%
%    Input, logical WALLS, is TRUE if the spheres must not extend
%    outside the unit hypercube.  If WALLS is FALSE, then this
%    restriction is not imposed.
%
%    Output, real RADIUS(N), the radius of the
%    maximal nonintersecting sphere around each point.
%
  FIXED = 0;
  FREE = 1;

  if ( walls )
    if ( any ( z(1:dim_num,1:n) < 0.0 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RADIUS_MAXIMUS - Fatal error!\n' );
      fprintf ( 1, '  Some coordinate is less than 0.\n' );
      error ( 'RADIUS_MAXIMUS - Fatal error!' );
    elseif ( any ( 1.0 < z(1:dim_num,1:n) ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RADIUS_MAXIMUS - Fatal error!\n' );
      fprintf ( 1, '  Some coordinate is greater than 1.\n' );
      error ( 'RADIUS_MAXIMUS - Fatal error!' );
    end
  end
%
%  Initially, all points are "free".
%
  radius(1:n) = 0.0;
  status(1:n) = FREE;

  while ( 1 )
%
%  If all points are fixed, we're done.
%
    if ( all ( status(1:n) == FIXED ) )
      break
    end
%
%  Look at all the free points.
%  Imagine an expanding sphere at each free point, and determine
%  which such sphere will first have to stop expanding.
%
    next = -1;
    radius_min = r8_huge ( );

    for j1 = 1 : n

      if ( status(j1) == FREE )

        if ( walls )
          radius_i = min ( min ( z(1:dim_num,j1) ), min ( 1.0 - z(1:dim_num,j1) ) );
        else
          radius_i = r8_huge ( );
        end

        for j2 = 1 : n

          if ( j2 ~= j1 )

            distance_j = sqrt ( sum ( ( z(1:dim_num,j1) - z(1:dim_num,j2) ).^2 ) );

            if ( status(j2) == FREE )
              radius_i = min ( radius_i, distance_j / 2.0 );
            else
              radius_i = min ( radius_i, distance_j - radius(j2) );
            end

          end

        end

        if ( radius_i < radius_min )
          next = j1;
          radius_min = radius_i;
        end

      end

    end

    if ( next == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RADIUS_MAXIMUS - Fatal error!\n' );
      fprintf ( 1, '  There were points left to handle, but could\n' );
      fprintf ( 1, '  not choose the "next" one to work on.\n' );
      error ( 'RADIUS_MAXIMUS - Fatal error!' );
    end

    radius(next) = radius_min;
    status(next) = FIXED;

  end

  return
end
function len = s_len_trim ( s )

%*****************************************************************************80
%
% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LENGTH, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end
function word_num = s_word_count ( s )

%*****************************************************************************80
%
%% S_WORD_COUNT counts the number of "words" in a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be examined.
%
%    Output, integer WORD_NUM, the number of "words" in the string.
%    Words are presumed to be separated by one or more blanks.
%
  FALSE = 0;
  TRUE = 1;

  word_num = 0;
  s_length = length ( s );

  if ( s_length <= 0 )
    return;
  end

  blank = TRUE;

  for i = 1 : s_length

    if ( s(i) == ' ' )
      blank = TRUE;
    elseif ( blank == TRUE )
      word_num = word_num + 1;
      blank = FALSE;
    end

  end

  return
end
function [ x, seed ] = sample_hypercube_uniform ( dim_num, n, seed )

%*****************************************************************************80
%
%% SAMPLE_HYPERCUBE_UNIFORM returns sample points in the unit hypercube.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, int DIM_NUM, the spatial dimension.
%
%    Input, int N, the number of points to compute.
%
%    Input/output, int SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the sample points.
%
  [ x, seed ] = r8mat_uniform_01 ( dim_num, n, seed );

  return
end
function s = sphere_measure ( dim_num, n, z )

%*****************************************************************************80
%
%% SPHERE_MEASURE determines the pointset quality measure S.
%
%  Discussion:
%
%    This routine computes a measure of even spacing in a set of
%    N points in the DIM_NUM-dimensional unit hypercube.  We will discuss 
%    the program as though the space is 2-dimensional and the spheres 
%    are circles, but the program may be used for general DIM_NUM-dimensional data.
%
%    The points are assumed to lie in the unit square.
%
%    The program makes a circle-packing measurement on the points
%    by assuming that, at each point, a circle is centered; all
%    the circles start out with zero radius, and then expand
%    together at the same rate.  A circle stops expanding as soon
%    as it touches any other circle.
%
%    The amount of area covered by the circles is compared to the
%    area of the unit square.  This measurement has a certain amount
%    of boundary effect: some circles will naturally extend outside
%    the unit hypercube.  If this is a concern, is possible to restrict
%    the circles to remain inside the unit hypercube.  In any case,
%    this problem generally goes away as the number of points increases.
%
%    Since we are interested in the coverage of the unit hypercube,
%    it is probably best if the circles are restricted.  This way,
%    computing the area of the circles gives a measure of the even
%    coverage of the region, relative to the presumably best possible
%    covering, by the same number of circles, but of equal radius.
%
%    In the limit, the maximum relative packing density of a 2D
%    region with equal-sized circles is 0.9069.  In 3D, a density
%    of at least 0.74 can be achieved, and it is known that no
%    greater than 0.7796 is possible.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Output, real S, the amount of volume taken up
%    by the nonintersecting spheres of maximum radius around each
%    point.  Ignoring boundary effects, the "ideal" value would be
%    1 (achievable only in 1 dimension), and the maximum value
%    possible is the sphere packing density in the given spatial
%    dimension.  If boundary effects can be ignored, the value of
%    SPHERE_VOLUME reports how closely the given set of points
%    behaves like a set of close-packed spheres.
%
%  Local Parameters:
%
%    Local, logical WALLS, is TRUE if the spheres are restricted
%    to lie within the unit hypercube.
%
  if ( ~r8mat_in_01 ( dim_num, n, z ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_MEASURE - Fatal error!\n' );
    fprintf ( 1, '  Some data is not in the unit hypercube.\n' );
    s = r8_huge ( );
  end

  walls = 1;
  verbose = 0;

  radius = radius_maximus ( dim_num, n, z, walls );

  s = 0.0;
  for j = 1 : n
    volume = sphere_volume_nd ( dim_num, radius(j) );
    s = s + volume;
  end

  if ( verbose )

    radius_ave = sum ( radius(1:n) ) / n;
    radius_min = min ( radius(1:n) );
    radius_max = max ( radius(1:n) );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of dimensions is %6d\n', dim_num );
    fprintf ( 1, '  Number of points is %6d\n', n );
    if ( walls )
      fprintf ( 1, 'Spheres stay in the unit hypercube.\n' );
    else
      fprintf ( 1, '  Spheres need not stay in the unit hypercube.\n' );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Average radius = %14f\n', radius_ave );
    fprintf ( 1, '  Minimum radius = %14f\n', radius_min );
    fprintf ( 1, '  Maximum radius = %14f\n', radius_max );
    fprintf ( 1, '  Sphere volume =  %14f\n', s );
  end

  return
end
function volume = sphere_volume_nd ( dim_num, r )

%*****************************************************************************80
%
%% SPHERE_VOLUME_ND computes the volume of a sphere in ND.
%
%  Formula:
%
%    A sphere in ND satisfies the equation:
%
%      sum ( ( X(1:N) - XC(1:N) )^2 ) = R^2
%
%    where R is the radius and XC is the center.
%
%  Discussion:
%
%    N  Volume
%
%    2             PI   * R^2
%    3  (4/3)    * PI   * R^3
%    4  (1/2)    * PI^2 * R^4
%    5  (8/15)   * PI^2 * R^5
%    6  (1/6)    * PI^3 * R^6
%    7  (16/105) * PI^3 * R^7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, real R, the radius of the sphere.
%
%    Output, real VOLUME, the volume of the sphere.
%
  if ( mod ( dim_num, 2 ) == 0 )
    m = floor ( dim_num / 2 );
    volume = pi^m;
    for i = 1 : m
      volume = volume / i;
    end
  else
    m = floor ( ( dim_num - 1 ) / 2 );
    volume = pi^m * 2.0^dim_num;
    for i = m+1 : 2*m+1
      volume = volume / i;
    end
  end

  volume = volume * r^dim_num;

  return
end
function tau = tau_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% TAU_MEASURE determines the pointset quality measure TAU.
%
%  Discussion:
%
%    The TAU measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%    For each point Z(I) in the pointset, let V(I) be the subregion
%    defined by the intersection of the region with the Voronoi
%    region associated with Z(I).
%
%    Let T(I) be the trace of the second moment tensor about the point
%    Z(I), associated with the region V(I).  Let T_BAR be the average
%    of the values of T(1:N).
%
%    Then TAU = maximum ( 1 <= I <= N ) abs ( T(I) - TBAR ).
%
%    This quantity can be estimated using sampling.  A given number of
%    sample points are generated in the region, assigned to the nearest
%    element of the pointset, and used to approximate the Voronoi regions
%    and the second moment tensors.
%
%    In an ideally regular mesh, the values of T would be equal, and so
%    TAU would be zero.  In general, the smaller TAU, the better.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the point distribution.
%
%    Input, integer NS, the number of sample points.
%
%    Input, character SAMPLE_ROUTINE, the name of the function to be used to
%    return sample points in the region.  The function must have the form
%      [ x, seed ] = sample_routine ( dim_num, n, seed )
%
%    Input, integer SEED_INIT, the initial value of the random number seed.
%
%    Output, real TAU, a quality measure.
%
  seed = seed_init;
  centroid(1:dim_num,1:n) = 0.0;
  hit(1:n) = 0;
  moment(1:dim_num,1:dim_num,1:n) = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    hit(closest(1)) = hit(closest(1)) + 1;

    centroid(1:dim_num,closest(1)) = centroid(1:dim_num,closest(1)) + x(1:dim_num);

    for i1 = 1 : dim_num
      for i2 = 1 : dim_num
        moment(i1,i2,closest(1)) = moment(i1,i2,closest(1)) + x(i1) * x(i2);
      end
    end

  end

  for j = 1 : n

    if ( 0 < hit(j) )

      centroid(1:dim_num,j) = centroid(1:dim_num,j) / hit(j);

      moment(1:dim_num,1:dim_num,j) = moment(1:dim_num,1:dim_num,j) / hit(j);

      for i1 = 1 : dim_num
        for i2 = 1 : dim_num
          moment(i1,i2,j) = moment(i1,i2,j) - centroid(i1,j) * centroid(i2,j);
        end
      end

    end

  end

  t(1:n) = 0.0;

  for j = 1 : n
    for i = 1 : dim_num
      t(j) = t(j) + moment(i,i,j);
    end
  end

  t_bar = sum ( t(1:n) ) / n;

  tau = max ( abs ( t(1:n) - t_bar ) );

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
