  module HashTableTypeToExpType 


    using MetaModelica
    #= ExportAll is not good practice but it makes it so that we do not have to write export after each function :( =#
    using ExportAll
    #= Necessary to write declarations for your uniontypes until Julia adds support for mutually recursive types =#

    FuncHashType = Function
    FuncTypeEqual = Function
    FuncTypeStr = Function
    FuncExpTypeStr = Function

         #= /*
         * This file is part of OpenModelica.
         *
         * Copyright (c) 1998-2014, Open Source Modelica Consortium (OSMC),
         * c/o Linköpings universitet, Department of Computer and Information Science,
         * SE-58183 Linköping, Sweden.
         *
         * All rights reserved.
         *
         * THIS PROGRAM IS PROVIDED UNDER THE TERMS OF GPL VERSION 3 LICENSE OR
         * THIS OSMC PUBLIC LICENSE (OSMC-PL) VERSION 1.2.
         * ANY USE, REPRODUCTION OR DISTRIBUTION OF THIS PROGRAM CONSTITUTES
         * RECIPIENT'S ACCEPTANCE OF THE OSMC PUBLIC LICENSE OR THE GPL VERSION 3,
         * ACCORDING TO RECIPIENTS CHOICE.
         *
         * The OpenModelica software and the Open Source Modelica
         * Consortium (OSMC) Public License (OSMC-PL) are obtained
         * from OSMC, either from the above address,
         * from the URLs: http:www.ida.liu.se/projects/OpenModelica or
         * http:www.openmodelica.org, and in the OpenModelica distribution.
         * GNU version 3 is obtained from: http:www.gnu.org/copyleft/gpl.html.
         *
         * This program is distributed WITHOUT ANY WARRANTY; without
         * even the implied warranty of  MERCHANTABILITY or FITNESS
         * FOR A PARTICULAR PURPOSE, EXCEPT AS EXPRESSLY SET FORTH
         * IN THE BY RECIPIENT SELECTED SUBSIDIARY LICENSE CONDITIONS OF OSMC-PL.
         *
         * See the full OSMC Public License conditions for more details.
         *
         */ =#
         #= /* Below is the instance specific code. For each hashtable the user must define:

        Key       - The key used to uniquely define elements in a hashtable
        Value     - The data to associate with each key
        hashFunc   - A function that maps a key to a positive integer.
        keyEqual   - A comparison function between two keys, returns true if equal.
        */ =#
         #= /* HashTable instance specific code */ =#

        import DAE

        import BaseHashTable

        import Types

        import System

        Key = DAE.Type 

        Value = DAE.Type 

        HashTableCrefFunctionsType = Tuple 

        HashTable = Tuple 









        function myHash(inTy::DAE.Type, hashMod::ModelicaInteger) ::ModelicaInteger 
              local hash::ModelicaInteger

              local str::String
              local tt::DAE.Type
              local t::DAE.Type

               #= str := Types.printTypeStr(inTy);
               =#
               #= hash := stringHashDjb2Mod(str, hashMod);
               =#
               #= print(\"hash: \" + intString(hash) + \" for \" + str + \"\\n\");
               =#
              (tt, _) = inTy
              t = (tt, NONE())
              hash = valueHashMod(t, hashMod)
          hash
        end

         #= Returns an empty HashTable.
         Using the default bucketsize.. =#
        function emptyHashTable() ::HashTable 
              local hashTable::HashTable

              hashTable = emptyHashTableSized(BaseHashTable.biggerBucketSize)
          hashTable
        end

         #= Returns an empty HashTable.
          Using the bucketsize size. =#
        function emptyHashTableSized(size::ModelicaInteger) ::HashTable 
              local hashTable::HashTable

              hashTable = BaseHashTable.emptyHashTableWork(size, (myHash, Types.typesElabEquivalent, Types.printTypeStr, Types.printExpTypeStr))
          hashTable
        end

    #= So that we can use wildcard imports and named imports when they do occur. Not good Julia practice =#
    @exportAll()
  end