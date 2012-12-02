function [ indx, jndx, value ] = mm_values_read ( input_unit, rep, field, nnz )

%*****************************************************************************80
%
%% MM_VALUES_READ reads matrix values from a Matrix Market file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer INPUT_UNIT, the input unit identifier.
%
%    Input, character ( len = 10 ) REP, the Matrix Market 'representation'
%    indicator.  Possible values include:
%    'coordinate'   (for sparse data)
%    'array'        (for dense data)
%    'elemental'    (to be added)
%
%    Input, character ( len = 7 ) FIELD, the Matrix Market 'field'.
%    Possible values include:
%    'real'
%    'double'
%    'complex'
%    'integer'
%    'pattern'
%
%    Input, integer NNZ, the number of nonzero entries required to store
%    the matrix, if REP = 'coordinate'.
%
%    Output, integer INDX(NNZ), the row indices for coordinate format.
%    Not used if REP is 'array'.
%
%    Output, integer JNDX(NNZ), the column indices for coordinate format.
%    Not used if REP is 'array'.
%
%    Output, complex VALUE(NNZ), the matrix values.
%
  if ( s_eqi ( rep, 'coordinate' ) )

    if ( s_eqi ( field, 'complex' ) )
        
      for i = 1 : nnz
          
        [ a, count ] = fscanf ( input_unit, '%d %d %f %f', 4 );
        
        if ( count < 3 ) then
          fprintf ( 1, '\n' );
          fprintf ( 1, 'MM_VALUES_READ - Fatal error!\n' );
          fprintf ( 1, '  Error or end of file reading value field.\n' );
          error ( 'MM_VALUES_READ - Fatal error!' );
        end
        
        indx(i) = a(1);
        jndx(i) = a(2);
        if ( count == 3 )
          value(i) = a(3);
        else
          value(i) = r82_to_c8 ( a(3), a(4) );
        end
      
      end

    elseif ( s_eqi ( field, 'integer' ) || s_eqi ( field, 'double' ) | ...
      s_eqi ( field, 'real' ) )
          
      for i = 1 : nnz
          
        [ a, count ] = fscanf ( input_unit, '%d %d %f', 3 );
        
        if ( count < 3 ) then
          fprintf ( 1, '\n' );
          fprintf ( 1, 'MM_VALUES_READ - Fatal error!\n' );
          fprintf ( 1, '  Error or end of file reading value field.\n' );
          error ( 'MM_VALUES_READ - Fatal error!' );
        end
        
        indx(i) = a(1);
        jndx(i) = a(2);
        value(i) = a(3);

      end
    
    elseif ( s_eqi ( field, 'pattern' ) )
        
      for i = 1 : nnz
          
        [ a, count ] = fscanf ( input_unit, '%d %d', 2 );
        
        if ( count < 2 ) then
          fprintf ( 1, '\n' );
          fprintf ( 1, 'MM_VALUES_READ - Fatal error!\n' );
          fprintf ( 1, '  Error or end of file reading value field.\n' );
          error ( 'MM_VALUES_READ - Fatal error!' );
        end
        
        indx(i) = a(1);
        jndx(i) = a(2);
        
      end
    
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MM_VALUES_READ - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of FIELD.\n' );
      error ( 'MM_VALUES_READ - Fatal error!' );
    end

  elseif ( s_eqi ( rep == 'array' ) )

    if ( s_eqi ( field, 'complex' ) )
        
      for i = 1 : nnz
          
        [ a, count ] = fscanf ( input_unit, '%f %f', 2 );
        
        if ( count < 1 ) then
          fprintf ( 1, '\n' );
          fprintf ( 1, 'MM_VALUES_READ - Fatal error!\n' );
          fprintf ( 1, '  Error or end of file reading value field.\n' );
          error ( 'MM_VALUES_READ - Fatal error!' );
        end
        
        if ( count == 1 )
          value(i) = a(1);
        else
          value(i) = r82_to_c8 ( a(1), a(2) );
        end
      
      end

    elseif ( s_eqi ( field, 'integer' ) || s_eqi ( field, 'double' ) | ...
      s_eqi ( field, '' ) )
  
      for i = 1 : nnz
          
        [ a, count ] = fscanf ( input_unit, '%f %f', 1 );
        
        if ( count < 1 ) then
          fprintf ( 1, '\n' );
          fprintf ( 1, 'MM_VALUES_READ - Fatal error!\n' );
          fprintf ( 1, '  Error or end of file reading value field.\n' );
          error ( 'MM_VALUES_READ - Fatal error!' );
        end
        
        value(i) = a(1);
      
      end
      
    else        
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MM_VALUES_READ - Fatal error!\n' );
      fprintf ( 1, '  Illegal value of FIELD.\n' );
      error ( 'MM_VALUES_READ - Fatal error!' );
    end

  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MM_VALUES_READ - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of REP.\n' );
    error ( 'MM_VALUES_READ - Fatal error!' );
  end

  return
end
