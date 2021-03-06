  module ErrorExt 


    using MetaModelica
    #= ExportAll is not good practice but it makes it so that we do not have to write export after each function :( =#
    using ExportAll

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
         * THIS OSMC LICENSE (OSMC-PL) VERSION 1.2.
         * ANY USE, REPRODUCTION OR DISTRIBUTION OF THIS PROGRAM CONSTITUTES
         * RECIPIENT'S ACCEPTANCE OF THE OSMC LICENSE OR THE GPL VERSION 3,
         * ACCORDING TO RECIPIENTS CHOICE.
         *
         * The OpenModelica software and the Open Source Modelica
         * Consortium (OSMC) License (OSMC-PL) are obtained
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
         * See the full OSMC License conditions for more details.
         *
         */ =#
        import Error

        global errors = nil::List
        global warnings = nil::List

        function registerModelicaFormatError()  
            #= TODO: Defined in the runtime =#
        end

        function addSourceMessage(id::Error.ErrorID, msg_type::Error.MessageType, msg_severity::Error.Severity, sline::ModelicaInteger, scol::ModelicaInteger, eline::ModelicaInteger, ecol::ModelicaInteger, read_only::Bool, filename::String, msg::String, tokens::List{<:String})  
            global errors
            global warnings
            _ = begin
              @match msg_severity begin
               Error.ERROR() => 
                 begin
                   errors = _cons("Error: " + filename + " msg: " + msg, errors)
                 end
               _ => 
                 begin
                   warnings = _cons("Warning: " + filename + " msg: " + msg, warnings)
                 end
              end
            end
            #= TODO: Defined in the runtime =#
        end

        function printMessagesStr(warningsAsErrors::Bool = false) ::String 
              local outString::String = stringDelimitList(errors, ", ")

            #= TODO: Defined in the runtime =#
          outString
        end

        function getNumMessages() ::ModelicaInteger 
              local num::ModelicaInteger = listLength(errors) + listLength(warnings)

            #= TODO: Defined in the runtime =#
          num
        end

        function getNumErrorMessages() ::ModelicaInteger 
              local num::ModelicaInteger = listLength(errors)

            #= TODO: Defined in the runtime =#
          num
        end

        function getNumWarningMessages() ::ModelicaInteger 
              local num::ModelicaInteger = listLength(warnings)

            #= TODO: Defined in the runtime =#
          num
        end

        function getMessages() ::List{Error.TotalMessage} 
              local res::List{Error.TotalMessage} = nil

            #= TODO: Defined in the runtime =#
          res
        end

        function clearMessages()  
            #= TODO: Defined in the runtime =#
            errors = nil
            warnings = nil
        end

         #= Used to rollback/delete checkpoints without considering the identifier. Used to reset the error messages after a stack overflow exception. =#
        function getNumCheckpoints() ::ModelicaInteger 
              local n::ModelicaInteger = 0

            #= TODO: Defined in the runtime =#
          n
        end

         #= Used to rollback/delete checkpoints without considering the identifier. Used to reset the error messages after a stack overflow exception. =#
        function rollbackNumCheckpoints(n::ModelicaInteger)  
            #= TODO: Defined in the runtime =#
        end

         #= Used to rollback/delete checkpoints without considering the identifier. Used to reset the error messages after a stack overflow exception. =#
        function deleteNumCheckpoints(n::ModelicaInteger)  
            #= TODO: Defined in the runtime =#
        end

         #= sets a checkpoint for the error messages, so error messages can be rolled back (i.e. deleted) up to this point
        A unique identifier for this checkpoint must be provided. It is checked when doing rollback or deletion =#
        function setCheckpoint(id::String #= uniqe identifier for the checkpoint (up to the programmer to guarantee uniqueness) =#)  
            #= TODO: Defined in the runtime =#
        end

         #= deletes the checkpoint at the top of the stack without
        removing the error messages issued since that checkpoint.
        If the checkpoint id doesn't match, the application exits with -1.
         =#
        function delCheckpoint(id::String #= unique identifier =#)  
            #= TODO: Defined in the runtime =#
        end

        function printErrorsNoWarning() ::String 
              local outString::String = stringDelimitList(errors, ", ")

            #= TODO: Defined in the runtime =#
          outString
        end

         #= rolls back error messages until the latest checkpoint,
        deleting all error messages added since that point in time. A unique identifier for the checkpoint must be provided
        The application will exit with return code -1 if this identifier does not match. =#
        function rollBack(id::String #= unique identifier =#)  
            #= TODO: Defined in the runtime =#
        end

         #= rolls back error messages until the latest checkpoint,
        returning all error messages added since that point in time. A unique identifier for the checkpoint must be provided
        The application will exit with return code -1 if this identifier does not match. =#
        function popCheckPoint(id::String #= unique identifier =#) ::List{ModelicaInteger} 
              local handles::List{ModelicaInteger} #= opaque pointers; you MUST pass them back or memory is leaked =# = nil

            #= TODO: Defined in the runtime =#
          handles #= opaque pointers; you MUST pass them back or memory is leaked =#
        end

         #= Pushes stored pointers back to the error stack. =#
        function pushMessages(handles::List{<:ModelicaInteger} #= opaque pointers from popCheckPoint =#)  
            #= TODO: Defined in the runtime =#
        end

         #= Pushes stored pointers back to the error stack. =#
        function freeMessages(handles::List{<:ModelicaInteger} #= opaque pointers from popCheckPoint =#)  
            #= TODO: Defined in the runtime =#
        end

         #= @author: adrpo
          This function checks if the specified checkpoint exists AT THE TOP OF THE STACK!.
          You can use it to rollBack/delete a checkpoint, but you're
          not sure that it exists (due to MetaModelica backtracking). =#
        function isTopCheckpoint(id::String #= unique identifier =#) ::Bool 
              local isThere::Bool #= tells us if the checkpoint exists (true) or doesn't (false) =# = true

            #= TODO: Defined in the runtime =#
          isThere #= tells us if the checkpoint exists (true) or doesn't (false) =#
        end

        function setShowErrorMessages(inShow::Bool)  
            #= TODO: Defined in the runtime =#
        end

        function moveMessagesToParentThread()  
            #= TODO: Defined in the runtime =#
        end

         #= Makes assert() and other runtime assertions print to the error buffer =#
        function initAssertionFunctions()  
            #= TODO: Defined in the runtime =#
        end

    #= So that we can use wildcard imports and named imports when they do occur. Not good Julia practice =#
    @exportAll()
  end