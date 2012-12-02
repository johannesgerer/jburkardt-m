function ply_display ( ply_filename )

%*****************************************************************************80
%
%% PLY_DISPLAY displays graphic information stored in an PLY file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    xy_display ( 'xy_filename' )
%
%  Parameters:
%
%    Input, string PLY_FILENAME, the name of the PLY file.
%
  verbose = 0;

  if ( verbose ) 
    fprintf ( 1, '\n' );
    timestamp ( );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLY_DISPLAY\n' );
    fprintf ( 1, '  MATLAB version\n' );
    fprintf ( 1, '  Read a PLY file and display it\n' );
  end
%
%  If first argument not supplied, request it from the user.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XY_DISPLAY:\n' );
    ply_filename = input ( '  Enter the name of the point file (in ''quotes''!).\n' );
  end
%
%  Extract node and element information.
%
  [ node_xyz, element_node ] = ply_to_tri_surface ( ply_filename );
%
%  View the object.
%
  trisurf ( element_node', node_xyz(1,:), node_xyz(2,:), node_xyz(3,:) );
  axis equal;
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<--- Z --->' );
  title ( ply_filename );
%
%  Terminate.
%
  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLY_DISPLAY:\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    fprintf ( 1, '\n' );
    timestamp ( );
  end

  return
end
function [ node_xyz, triangle_node ] = ply_to_tri_surface ( ply_filename )

%*****************************************************************************80
%
%% PLY_TO_TRI_SURFACE converts data from a PLY file to TRI_SURFACE data.
%
%  Discussion:
%
%    This routine reads a PLY file, searches for the data that defines
%    a polygonal surface, reduces polygons to triangles, and returns
%    a pair of arrays that define a TRI_SURFACE, that is a triangular
%    mesh of a surface in 3D.
%
%  Example:
%
%     [ node_xyz, triangle_node ] = ply_to_tri_surface ( 'cow.ply' );
%
%     trisurf ( triangle_node', node_xyz(1,:), node_xyz(2,:), node_xyz(3,:) );
%
%     colormap ( gray ); 
%     axis equal;
%
%  Discussion:
%
%    The original version of this program had a mistake that meant it
%    did not properly triangulate files whose faces were not already triangular.
%    This has been corrected (JVB, 25 February 2007).
%
%  Modified:
%
%    01 March 2007
%
%  Author:
%
%    Pascal Getreuer 2004
%    Modifications by John Burkardt
%
%  Parameters:
%
%    Input, string PLY_FILENAME, the name of the PLY file to be read.
%
%    Output, real NODE_XYZ(3,NODE_NUM), the coordinates of the nodes.
%
%    Output, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the indices of nodes
%    that make up the triangles.
%
%  Local Parameters:
%
%    COMMENTS, any comments from the file.
%
%    ELEMENTCOUNT, the number of each type of element in file.
%
%    ELEMENTS, the element data.
%
%    LISTFLAG is 1 if there is a list type.
%
%    PROPERTYTYPES, the element property types.
%
%    SAMEFLAT is 1 if all types are the same.
%
%    SIZEOF, size in bytes of each type.
%

%
%  Open the input file in "read text" mode.
%
  [ fid, Msg ] = fopen ( ply_filename, 'rt' );

  if ( fid == -1 )
    error ( Msg );
  end

  Buf = fscanf ( fid, '%s', 1 );

  if ( ~strcmp ( Buf, 'ply' ) )
    fclose ( fid );
    error('Not a PLY file.');
  end
%
%  Read the header.
%
  Position = ftell(fid);
  Format = '';
  NumComments = 0;
  Comments = {};
  NumElements = 0;
  NumProperties = 0;
  Elements = [];
  ElementCount = [];
  PropertyTypes = [];
  ElementNames = {};  % list of element names in the order they are stored in the file
  PropertyNames = [];  % structure of lists of property names

  while ( 1 )
%
%  Read a line from the file.
%
    Buf = fgetl ( fid );
    BufRem = Buf;
    Token = {};
    Count = 0;
%
%  Split the line into tokens.
%
    while ( ~isempty(BufRem) )

      [ tmp, BufRem ] = strtok(BufRem);
%
%  Count the tokens.
%
      if ( ~isempty ( tmp ) )
        Count = Count + 1;
        Token{Count} = tmp;
      end

    end
%
%  Parse the line.
%
    if ( Count )

      switch lower ( Token{1} )
%
%  Read the data format.
%
      case 'format'

        if ( 2 <= Count )

          Format = lower ( Token{2} );

          if ( Count == 3 & ~strcmp ( Token{3}, '1.0' ) )
            fclose ( fid );
            error('Only PLY format version 1.0 supported.');
          end
        end
%
%  Read a comment.
%
      case 'comment'

        NumComments = NumComments + 1;
        Comments{NumComments} = '';
        for i = 2 : Count
          Comments{NumComments} = [Comments{NumComments},Token{i},' '];
        end
%
%  Read an element name.
%
      case 'element'

        if ( 3 <= Count )

          if ( isfield(Elements,Token{2}) )
            fclose ( fid );
            error(['Duplicate element name, ''',Token{2},'''.']);
          end

          NumElements = NumElements + 1;
          NumProperties = 0;
          Elements = setfield(Elements,Token{2},[]);
          PropertyTypes = setfield(PropertyTypes,Token{2},[]);
          ElementNames{NumElements} = Token{2};
          PropertyNames = setfield(PropertyNames,Token{2},{});
          CurElement = Token{2};
          ElementCount(NumElements) = str2double(Token{3});

          if ( isnan(ElementCount(NumElements)) )
            fclose ( fid );
            error(['Bad element definition: ',Buf]);
          end

        else

          error(['Bad element definition: ',Buf]);

        end
%
%  Read an element property.
%
      case 'property'

        if ( ~isempty(CurElement) & Count >= 3 )

          NumProperties = NumProperties + 1;
          eval(['tmp=isfield(Elements.',CurElement,',Token{Count});'],...
            'fclose(fid);error([''Error reading property: '',Buf])');

          if ( tmp )
            error(['Duplicate property name, ''',CurElement,'.',Token{2},'''.']);
          end
%
%  Add property subfield to Elements.
%
          eval(['Elements.',CurElement,'.',Token{Count},'=[];'], ...
            'fclose(fid);error([''Error reading property: '',Buf])');
%
%  Add property subfield to PropertyTypes and save type.
%
          eval(['PropertyTypes.',CurElement,'.',Token{Count},'={Token{2:Count-1}};'], ...
            'fclose(fid);error([''Error reading property: '',Buf])');
%
%  Record property name order.
%
          eval(['PropertyNames.',CurElement,'{NumProperties}=Token{Count};'], ...
            'fclose(fid);error([''Error reading property: '',Buf])');

         else

           fclose ( fid );

           if ( isempty(CurElement) )
             error(['Property definition without element definition: ',Buf]);
           else
             error(['Bad property definition: ',Buf]);
           end

         end
%
%  End of header.
%
        case 'end_header'
          break;

      end
    end
  end
%
%  Set reading for specified data format.
%
  if ( isempty ( Format ) )
    warning('Data format unspecified, assuming ASCII.');
    Format = 'ascii';
  end

  switch Format

    case 'ascii'
      Format = 0;
    case 'binary_little_endian'
      Format = 1;
    case 'binary_big_endian'
      Format = 2;
    otherwise
      fclose ( fid );
      error(['Data format ''',Format,''' not supported.']);

  end
%
%  Read the rest of the file as ASCII data...
%
  if ( ~Format )
    Buf = fscanf ( fid, '%f' );
    BufOff = 1;
  else
%
%  ...or, close the file, and reopen in "read binary" mode.
%
    fclose ( fid );
%
%  Reopen the binary file as LITTLE_ENDIAN or BIG_ENDIAN.
%
    if ( Format == 1 )
      fid = fopen ( Path, 'r', 'ieee-le.l64' );
    else
      fid = fopen ( Path, 'r', 'ieee-be.l64' );
    end
%
%  Find the end of the header again.
%  Using ftell on the old handle doesn't give the correct position.
%
    BufSize = 8192;
    Buf = [ blanks(10), char(fread(fid,BufSize,'uchar')') ];
    i = [];
    tmp = -11;

    while ( isempty(i) )
%
%  Look for end_header + CR/LF
%
      i = findstr(Buf,['end_header',13,10]);
%
%  Look for end_header + LF
%   
      i = [i,findstr(Buf,['end_header',10])];  

      if ( isempty(i) )
        tmp = tmp + BufSize;
        Buf = [Buf(BufSize+1:BufSize+10),char(fread(fid,BufSize,'uchar')')];
      end

    end
%
%  Seek to just after the line feed
%
    fseek ( fid, i + tmp + 11 + (Buf(i + 10) == 13), -1 );

  end
%
%  Read element data.
%
%  PLY and MATLAB data types (for fread)
%
  PlyTypeNames = {'char','uchar','short','ushort','int','uint','float','double', ...
    'char8','uchar8','short16','ushort16','int32','uint32','float32','double64'};

  MatlabTypeNames = {'schar','uchar','int16','uint16','int32','uint32','single','double'};

  SizeOf = [1,1,2,2,4,4,4,8];

  for i = 1 : NumElements
%
%  get current element property information
%
    eval(['CurPropertyNames=PropertyNames.',ElementNames{i},';']);
    eval(['CurPropertyTypes=PropertyTypes.',ElementNames{i},';']);
    NumProperties = size(CurPropertyNames,2);
%
%  Read ASCII data.
%
    if ( ~Format )

      for j = 1 : NumProperties

        Token = getfield(CurPropertyTypes,CurPropertyNames{j});

        if ( strcmpi(Token{1},'list') )
          Type(j) = 1;
        else
          Type(j) = 0;
        end

      end
%
%  Parse the buffer.
%
      if ( ~any(Type) )
%
%  No list types
%
        Data = reshape ( ...
          Buf(BufOff:BufOff+ElementCount(i)*NumProperties-1), ...
          NumProperties, ElementCount(i) )';

        BufOff = BufOff + ElementCount(i) * NumProperties;

      else

        ListData = cell(NumProperties,1);

        for k = 1 : NumProperties
          ListData{k} = cell(ElementCount(i),1);
        end
%
%  list type
%
        for j = 1 : ElementCount(i)
          for k = 1 : NumProperties

            if ( ~Type(k) )
              Data(j,k) = Buf(BufOff);
              BufOff = BufOff + 1;
            else
              tmp = Buf(BufOff);
              ListData{k}{j} = Buf(BufOff+(1:tmp))';
              BufOff = BufOff + tmp + 1;
            end

          end
        end

      end
%
%  Read binary data.
%
    else
%
%  Translate PLY data type names to MATLAB data type names
%
      ListFlag = 0;
      SameFlag = 1;

      for j = 1 : NumProperties

        Token = getfield(CurPropertyTypes,CurPropertyNames{j});
%
%  Non-list type.
%
        if ( ~strcmp(Token{1},'list' ) )

          tmp = rem(strmatch(Token{1},PlyTypeNames,'exact')-1,8)+1;

          if ( ~isempty(tmp) )

            TypeSize(j) = SizeOf(tmp);
            Type{j} = MatlabTypeNames{tmp};
            TypeSize2(j) = 0;
            Type2{j} = '';

            SameFlag = SameFlag & strcmp(Type{1},Type{j});

          else

            fclose(fid);
            error(['Unknown property data type, ''',Token{1},''', in ', ...
              ElementNames{i},'.',CurPropertyNames{j},'.']);

          end
%
%  List type.
%
        else

          if ( length(Token) == 3 )

            ListFlag = 1;
            SameFlag = 0;
            tmp = rem(strmatch(Token{2},PlyTypeNames,'exact')-1,8)+1;
            tmp2 = rem(strmatch(Token{3},PlyTypeNames,'exact')-1,8)+1;

            if ( ~isempty(tmp) & ~isempty(tmp2) )
              TypeSize(j) = SizeOf(tmp);
              Type{j} = MatlabTypeNames{tmp};
              TypeSize2(j) = SizeOf(tmp2);
              Type2{j} = MatlabTypeNames{tmp2};
            else
              fclose(fid);
              error(['Unknown property data type, ''list ',Token{2},' ',Token{3},''', in ', ...
                ElementNames{i},'.',CurPropertyNames{j},'.']);
            end

          else

            fclose(fid);
            error(['Invalid list syntax in ',ElementNames{i},'.',CurPropertyNames{j},'.']);

          end

        end

      end
%
%  read file
%
      if ( ~ListFlag )
%
%  No list types, all the same type (fast)
%
        if ( SameFlag )

          Data = fread(fid,[NumProperties,ElementCount(i)],Type{1})';
%
%  No list types, mixed type.
%
        else

          Data = zeros(ElementCount(i),NumProperties);

          for j = 1 : ElementCount(i)
            for k = 1 : NumProperties
              Data(j,k) = fread(fid,1,Type{k});
            end
          end

        end

      else

        ListData = cell(NumProperties,1);

        for k = 1 : NumProperties
          ListData{k} = cell(ElementCount(i),1);
        end

        if ( NumProperties == 1 )

          BufSize = 512;
          SkipNum = 4;
          j = 0;
%
%  List type, one property (fast if lists are usually the same length)
%
          while ( j < ElementCount(i) )

            BufSize = min(ElementCount(i)-j,BufSize);
            Position = ftell(fid);
%
%  Read in BufSize count values, assuming all counts = SkipNum
%
            [Buf,BufSize] = fread(fid,BufSize,Type{1},SkipNum*TypeSize2(1));
%
%  Find first count that is not SkipNum
%
            Miss = find(Buf ~= SkipNum); 
%
%  Seek back to after first count
%    
            fseek(fid,Position + TypeSize(1),-1);   

            if ( isempty(Miss) )
%
%  All counts are SkipNum.
%
              Buf = fread(fid,[SkipNum,BufSize],[int2str(SkipNum),'*',Type2{1}],TypeSize(1))';
%
%  Undo the last skip.
%
              fseek(fid,-TypeSize(1),0);

              for k = 1:BufSize
                ListData{1}{j+k} = Buf(k,:);
              end

              j = j + BufSize;
              BufSize = floor ( 1.5 * BufSize );

            else
%
%  Some counts are SkipNum.
%
              if ( 1 < Miss(1) )

                Buf2 = fread ( fid, [SkipNum,Miss(1)-1],[int2str(SkipNum),'*',Type2{1}],TypeSize(1))';

                for k = 1:Miss(1)-1
                  ListData{1}{j+k} = Buf2(k,:);
                end

                j = j + k;

              end
%
%  Read in the list with the missed count.
%
              SkipNum = Buf(Miss(1));
              j = j + 1;
              ListData{1}{j} = fread ( fid, [1,SkipNum],Type2{1} );
              BufSize = ceil ( 0.6 * BufSize );

            end
          end

        else
%
%  List type(s), multiple properties (slow)
%
          Data = zeros(ElementCount(i),NumProperties);

          for j = 1 : ElementCount(i)
            for k = 1 : NumProperties

              if ( isempty(Type2{k}) )
                Data(j,k) = fread(fid,1,Type{k});
              else
                tmp = fread(fid,1,Type{k});
                ListData{k}{j} = fread(fid,[1,tmp],Type2{k});
              end

            end
          end
        end
      end
    end
%
%  Put data into Elements structure
%
    for k = 1 : NumProperties

      if ( ( ~Format & ~Type(k) ) | (Format & isempty(Type2{k})) )
        eval(['Elements.',ElementNames{i},'.',CurPropertyNames{k},'=Data(:,k);']);
      else
        eval(['Elements.',ElementNames{i},'.',CurPropertyNames{k},'=ListData{k};']);
      end

    end

  end

  clear Data
  clear ListData;

  fclose ( fid );
%
%  Output the data as a triangular mesh pair.
%
%  Find vertex element field.
%
  Name = {'vertex','Vertex','point','Point','pts','Pts'};
  Names = [];

  for i = 1 : length(Name)

    if ( any ( strcmp ( ElementNames, Name{i} ) ) )
      Names = getfield(PropertyNames,Name{i});
      Name = Name{i};
      break;
    end

  end

  if ( any(strcmp(Names,'x')) & any(strcmp(Names,'y')) & any(strcmp(Names,'z')) )
    eval(['node_xyz=[Elements.',Name,'.x,Elements.',Name,'.y,Elements.',Name,'.z];']);
  else
    node_xyz = zeros(1,3);
  end
  node_xyz = node_xyz';

  triangle_node = [];

% Find face element field

  Name = {'face','Face','poly','Poly','tri','Tri'};
  Names = [];

  for i = 1 : length(Name)
    if ( any(strcmp(ElementNames,Name{i})) )
      Names = getfield(PropertyNames,Name{i});
      Name = Name{i};
      break;
    end
  end

  if ( ~isempty(Names) )
      % find vertex indices property subfield
    PropertyName = {'vertex_indices','vertex_indexes','vertex_index','indices','indexes'};

    for i = 1 : length(PropertyName)
      if ( any(strcmp(Names,PropertyName{i})) )
        PropertyName = PropertyName{i};
        break;
      end
    end
%
%  Convert face index list to triangular connectivity.
%
    if ( ~iscell(PropertyName) )

      eval(['FaceIndices=Elements.',Name,'.',PropertyName,';']);
      N = length(FaceIndices);
      triangle_node = zeros(3,N*2);
      Extra = 0;

      for k = 1 : N

        triangle_node(1:3,k) = FaceIndices{k}(1:3)';

        for j = 4 : length(FaceIndices{k})
          Extra = Extra + 1;
          triangle_node(1,N + Extra) = FaceIndices{k}(1);
          triangle_node(2,N + Extra) = FaceIndices{k}(j-1);
          triangle_node(3,N + Extra) = FaceIndices{k}(j);
        end

      end
%
%  Add 1 to each vertex value; PLY vertices are zero based.
%
      triangle_node = triangle_node(:,1:N+Extra) + 1;

    end
  end

  return
end
