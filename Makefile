CXX?=		clang++
AR?=		ar
RANLIB?=	ranlib
PREFIX?=	/usr/local
PYTHON?=	$(PREFIX)/bin/python2
INSTALL?=	install

all: clientlib

clientlib:
	mkdir ./build
	mkdir ./build/mongo
	mkdir ./build/mongo/base
	mkdir ./build/mongo/bson
	mkdir ./build/mongo/bson/util
	mkdir ./build/mongo/client
	mkdir ./build/mongo/db
	mkdir ./build/mongo/db/auth
	mkdir ./build/mongo/db/ops
	mkdir ./build/mongo/db/repl
	mkdir ./build/mongo/db/stats
	mkdir ./build/mongo/platform
	mkdir ./build/mongo/s
	mkdir ./build/mongo/scripting
	mkdir ./build/mongo/shell
	mkdir ./build/mongo/util
	mkdir ./build/mongo/util/concurrency
	mkdir ./build/mongo/util/mongoutils
	mkdir ./build/mongo/util/net
	mkdir ./build/third_party
	mkdir ./build/third_party/murmurhash3/
	$(PYTHON) src/mongo/base/generate_error_codes.py src/mongo/base/error_codes.err build/mongo/base/error_codes.h build/mongo/base/error_codes.cpp
	$(CXX) -o build/mongo/base/configuration_variable_manager.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/configuration_variable_manager.cpp
	$(CXX) -o build/mongo/base/error_codes.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include -I$(PREFIX) build/mongo/base/error_codes.cpp
	$(CXX) -o build/mongo/base/global_initializer.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/global_initializer.cpp
	$(CXX) -o build/mongo/base/global_initializer_registerer.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/global_initializer_registerer.cpp
	$(CXX) -o build/mongo/base/init.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/init.cpp
	$(CXX) -o build/mongo/base/initializer.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/initializer.cpp
	$(CXX) -o build/mongo/base/initializer_context.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/initializer_context.cpp
	$(CXX) -o build/mongo/base/initializer_dependency_graph.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/initializer_dependency_graph.cpp
	$(CXX) -o build/mongo/base/make_string_vector.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/make_string_vector.cpp
	$(CXX) -o build/mongo/base/parse_number.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/parse_number.cpp
	$(CXX) -o build/mongo/base/status.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/status.cpp
	$(CXX) -o build/mongo/base/string_data.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/base/string_data.cpp
	$(CXX) -o build/mongo/bson/bson_validate.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/bson/bson_validate.cpp
	$(CXX) -o build/mongo/bson/oid.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/bson/oid.cpp
	$(CXX) -o build/mongo/bson/util/bson_extract.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/bson/util/bson_extract.cpp
	$(CXX) -o build/mongo/buildinfo.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/buildinfo.cpp
	$(CXX) -o build/mongo/client/clientAndShell.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/clientAndShell.cpp
	$(CXX) -o build/mongo/client/clientOnly.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/clientOnly.cpp
	$(CXX) -o build/mongo/client/connection_factory.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/connection_factory.cpp
	$(CXX) -o build/mongo/client/connpool.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/connpool.cpp
	$(CXX) -o build/mongo/client/dbclient.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/dbclient.cpp
	$(CXX) -o build/mongo/client/dbclient_rs.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/dbclient_rs.cpp
	$(CXX) -o build/mongo/client/dbclientcursor.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/dbclientcursor.cpp
	$(CXX) -o build/mongo/client/gridfs.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/gridfs.cpp
	$(CXX) -o build/mongo/client/model.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/model.cpp
	$(CXX) -o build/mongo/client/sasl_client_authenticate.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/sasl_client_authenticate.cpp
	$(CXX) -o build/mongo/client/syncclusterconnection.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/syncclusterconnection.cpp
	$(CXX) -o build/mongo/db/jsobj.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/db/jsobj.cpp
	$(CXX) -o build/mongo/db/json.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/db/json.cpp
	$(CXX) -o build/mongo/db/lasterror.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/db/lasterror.cpp
	$(CXX) -o build/mongo/db/namespace.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/db/namespace.cpp
	$(CXX) -o build/mongo/db/dbmessage.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/db/dbmessage.cpp
	$(CXX) -o build/mongo/pch.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/pch.cpp
	$(CXX) -o build/mongo/platform/random.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/platform/random.cpp
	$(CXX) -o build/mongo/util/assert_util.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/assert_util.cpp
	$(CXX) -o build/mongo/util/background.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/background.cpp
	$(CXX) -o build/mongo/util/base64.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/base64.cpp
	$(CXX) -o build/mongo/util/concurrency/rwlockimpl.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/concurrency/rwlockimpl.cpp
	$(CXX) -o build/mongo/util/concurrency/spin_lock.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/concurrency/spin_lock.cpp
	$(CXX) -o build/mongo/util/concurrency/synchronization.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/concurrency/synchronization.cpp
	$(CXX) -o build/mongo/util/concurrency/task.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/concurrency/task.cpp
	$(CXX) -o build/mongo/util/concurrency/thread_pool.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/concurrency/thread_pool.cpp
	$(CXX) -o build/mongo/util/concurrency/mutexdebugger.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/concurrency/mutexdebugger.cpp
	$(CXX) -o build/mongo/util/debug_util.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/debug_util.cpp
	$(CXX) -o build/mongo/util/stacktrace.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/stacktrace.cpp
	$(CXX) -o build/mongo/util/file.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/file.cpp
	$(CXX) -o build/mongo/util/file_allocator.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/file_allocator.cpp
	$(CXX) -o build/mongo/util/fail_point.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/fail_point.cpp
	$(PYTHON) src/mongo/db/auth/generate_action_types.py src/mongo/db/auth/action_types.txt build/mongo/db/auth/action_type.h build/mongo/db/auth/action_type.cpp
	$(CXX) -o build/mongo/util/fail_point_registry.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/fail_point_registry.cpp
	$(CXX) -o build/mongo/util/fail_point_service.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/fail_point_service.cpp
	$(CXX) -o build/mongo/util/histogram.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/histogram.cpp
	$(CXX) -o build/mongo/util/intrusive_counter.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/intrusive_counter.cpp
	$(CXX) -o build/mongo/util/log.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/log.cpp
	$(CXX) -o build/mongo/util/md5.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/md5.cpp
	$(CXX) -o build/mongo/util/md5main.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/md5main.cpp
	$(CXX) -o build/mongo/util/net/httpclient.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/net/httpclient.cpp
	$(CXX) -o build/mongo/util/net/listen.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/net/listen.cpp
	$(CXX) -o build/mongo/util/net/message.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/net/message.cpp
	$(CXX) -o build/mongo/util/net/message_port.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/net/message_port.cpp
	$(CXX) -o build/mongo/util/net/sock.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/net/sock.cpp
	$(CXX) -o build/mongo/util/net/ssl_manager.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/net/ssl_manager.cpp
	$(CXX) -o build/mongo/util/password.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/password.cpp
	$(CXX) -o build/mongo/util/processinfo.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/processinfo.cpp
	$(CXX) -o build/mongo/util/ramlog.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/ramlog.cpp
	$(CXX) -o build/mongo/util/signal_handlers.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/signal_handlers.cpp
	$(CXX) -o build/mongo/util/stringutils.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/stringutils.cpp
	$(CXX) -o build/mongo/util/text.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/text.cpp
	$(CXX) -o build/mongo/util/time_support.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/time_support.cpp
	$(CXX) -o build/mongo/util/timer.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/timer.cpp
	$(CXX) -o build/mongo/util/trace.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/trace.cpp
	$(CXX) -o build/mongo/util/util.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/util.cpp
	$(CXX) -o build/mongo/util/version.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/version.cpp
	$(CXX) -o build/third_party/murmurhash3/MurmurHash3.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/third_party/murmurhash3/MurmurHash3.cpp
	$(CXX) -o build/mongo/client/sasl_client_authenticate_impl.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/sasl_client_authenticate_impl.cpp
	$(CXX) -o build/mongo/client/sasl_client_session.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/client/sasl_client_session.cpp
	$(CXX) -o build/mongo/util/processinfo_freebsd.o -c -DMONGO_EXPOSE_MACROS -Ibuild -Isrc -Ibuild/mongo -Isrc/mongo -I$(PREFIX)/include src/mongo/util/processinfo_freebsd.cpp
	ar rc build/libmongoclient.a build/mongo/base/configuration_variable_manager.o build/mongo/base/error_codes.o build/mongo/base/global_initializer.o build/mongo/base/global_initializer_registerer.o build/mongo/base/init.o build/mongo/base/initializer.o build/mongo/base/initializer_context.o build/mongo/base/initializer_dependency_graph.o build/mongo/base/make_string_vector.o build/mongo/base/parse_number.o build/mongo/base/status.o build/mongo/base/string_data.o build/mongo/bson/bson_validate.o build/mongo/bson/oid.o build/mongo/bson/util/bson_extract.o build/mongo/buildinfo.o build/mongo/client/clientAndShell.o build/mongo/client/clientOnly.o build/mongo/client/connection_factory.o build/mongo/client/connpool.o build/mongo/client/dbclient.o build/mongo/client/dbclient_rs.o build/mongo/client/dbclientcursor.o build/mongo/client/gridfs.o build/mongo/client/model.o build/mongo/client/sasl_client_authenticate.o build/mongo/client/syncclusterconnection.o build/mongo/db/jsobj.o build/mongo/db/json.o build/mongo/db/lasterror.o build/mongo/db/namespace.o build/mongo/db/dbmessage.o build/mongo/pch.o build/mongo/platform/random.o build/mongo/util/assert_util.o build/mongo/util/background.o build/mongo/util/base64.o build/mongo/util/concurrency/rwlockimpl.o build/mongo/util/concurrency/spin_lock.o build/mongo/util/concurrency/synchronization.o build/mongo/util/concurrency/task.o build/mongo/util/concurrency/thread_pool.o build/mongo/util/concurrency/mutexdebugger.o build/mongo/util/debug_util.o build/mongo/util/stacktrace.o build/mongo/util/file.o build/mongo/util/file_allocator.o build/mongo/util/fail_point.o build/mongo/util/fail_point_registry.o build/mongo/util/fail_point_service.o build/mongo/util/histogram.o build/mongo/util/intrusive_counter.o build/mongo/util/log.o build/mongo/util/md5.o build/mongo/util/md5main.o build/mongo/util/net/httpclient.o build/mongo/util/net/listen.o build/mongo/util/net/message.o build/mongo/util/net/message_port.o build/mongo/util/net/sock.o build/mongo/util/net/ssl_manager.o build/mongo/util/password.o build/mongo/util/processinfo.o build/mongo/util/ramlog.o build/mongo/util/signal_handlers.o build/mongo/util/stringutils.o build/mongo/util/text.o build/mongo/util/time_support.o build/mongo/util/timer.o build/mongo/util/trace.o build/mongo/util/util.o build/mongo/util/version.o build/third_party/murmurhash3/MurmurHash3.o build/mongo/client/sasl_client_authenticate_impl.o build/mongo/client/sasl_client_session.o build/mongo/util/processinfo_freebsd.o
	ranlib build/libmongoclient.a

clean:
	rm -Rf build

install:
	$(INSTALL) -m 644 ./build/libmongoclient.a $(PREFIX)/lib
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/bson/util/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/db/ops/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/db/stats/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/shell/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/util/mongoutils/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/third_party/
	$(INSTALL) -m 755 -d $(PREFIX)/include/mongo/third_party/murmurhash3/
	$(INSTALL) -m 644 ./src/mongo/client/authlevel.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/clientOnly-private.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/connpool.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/dbclient.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/dbclient_rs.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/dbclientcursor.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/dbclientinterface.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/dbclientmockcursor.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/distlock.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/gridfs.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/model.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/parallel.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/redef_macros.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/sasl_client_authenticate.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/sasl_client_session.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/syncclusterconnection.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/undef_macros.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/client/constants.h $(PREFIX)/include/mongo/client/
	$(INSTALL) -m 644 ./src/mongo/db/auth/action_type.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/action_set.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/auth_external_state.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/auth_external_state_d.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/auth_external_state_mock.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/auth_external_state_s.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/auth_external_state_server_common.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/auth_index_d.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/authentication_session.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/authorization_manager.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/mongo_authentication_session.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/principal.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/principal_name.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/principal_set.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/privilege.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/privilege_set.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/auth/security_key.h $(PREFIX)/include/mongo/db/auth/
	$(INSTALL) -m 644 ./src/mongo/db/stats/counters.h $(PREFIX)/include/mongo/db/stats/
	$(INSTALL) -m 644 ./src/mongo/db/stats/fine_clock.h $(PREFIX)/include/mongo/db/stats/
	$(INSTALL) -m 644 ./src/mongo/db/stats/service_stats.h $(PREFIX)/include/mongo/db/stats/
	$(INSTALL) -m 644 ./src/mongo/db/stats/snapshots.h $(PREFIX)/include/mongo/db/stats/
	$(INSTALL) -m 644 ./src/mongo/db/stats/timer_stats.h $(PREFIX)/include/mongo/db/stats/
	$(INSTALL) -m 644 ./src/mongo/db/stats/top.h $(PREFIX)/include/mongo/db/stats/
	$(INSTALL) -m 644 ./src/mongo/db/repl/rs_sync.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/repl/connections.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/repl/health.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/repl/multicmd.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/repl/rs.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/repl/rs_config.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/repl/rs_exception.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/repl/rs_member.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/repl/rs_optime.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/repl/bgsync.h $(PREFIX)/include/mongo/db/repl/
	$(INSTALL) -m 644 ./src/mongo/db/ops/count.h $(PREFIX)/include/mongo/db/ops/
	$(INSTALL) -m 644 ./src/mongo/db/ops/delete.h $(PREFIX)/include/mongo/db/ops/
	$(INSTALL) -m 644 ./src/mongo/db/ops/modifier_base.h $(PREFIX)/include/mongo/db/ops/
	$(INSTALL) -m 644 ./src/mongo/db/ops/query.h $(PREFIX)/include/mongo/db/ops/
	$(INSTALL) -m 644 ./src/mongo/db/ops/update.h $(PREFIX)/include/mongo/db/ops/
	$(INSTALL) -m 644 ./src/mongo/db/ops/update_internal.h $(PREFIX)/include/mongo/db/ops/
	$(INSTALL) -m 644 ./src/mongo/db/background.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/btree.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/btree_stats.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/btreebuilder.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/btreecursor.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/btreeposition.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/cc_by_loc.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/client.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/client_basic.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/clientcursor.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/cloner.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/cmdline.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/collection.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/commands.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/curop-inl.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/curop.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/db.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/cursor.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/d_concurrency.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/d_globals.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/database.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/databaseholder.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dbhelpers.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dbmessage.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dbwebserver.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/diskloc.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dur.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dur_commitjob.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dur_journal.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dur_journalformat.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dur_journalimpl.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dur_recover.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/dur_stats.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/durop.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/explain.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/extsort.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/field_ref.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/filever.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/hasher.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/hashindex.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/index.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/index_set.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/index_insertion_continuation.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/index_rebuilder.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/index_update.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/indexkey.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/initialize_server_global_state.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/instance.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/interrupt_status.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/interrupt_status_mongod.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/intervalbtreecursor.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/introspect.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/jsobj.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/jsobjmanipulator.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/json.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/key.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/keypattern.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/kill_current_op.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/lasterror.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/lockstat.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/lockstate.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/matcher.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/memconcept.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/minilex.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/module.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/mongommf.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/namespace-inl.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/namespace.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/namespace_details-inl.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/namespace_details.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/namespacestring.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/oplog.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/oplogreader.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/pagefault.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/pdfile.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/pdfile_private.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/pdfile_version.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/prefetch.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/projection.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/queryoptimizer.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/queryoptimizercursor.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/queryoptimizercursorimpl.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/queryutil.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/querypattern.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/queryutil-inl.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/record.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/repl_block.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/replutil.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/resource.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/restapi.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/scanandorder.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/server_parameters.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/server_parameters_inline.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/sort_phase_one.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/taskqueue.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/ttl.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/db/repl.h $(PREFIX)/include/mongo/db/
	$(INSTALL) -m 644 ./src/mongo/bson/util/atomic_int.h $(PREFIX)/include/mongo/bson/util/
	$(INSTALL) -m 644 ./src/mongo/bson/util/bson_extract.h $(PREFIX)/include/mongo/bson/util/
	$(INSTALL) -m 644 ./src/mongo/bson/util/builder.h $(PREFIX)/include/mongo/bson/util/
	$(INSTALL) -m 644 ./src/mongo/bson/util/misc.h $(PREFIX)/include/mongo/bson/util/
	$(INSTALL) -m 644 ./src/mongo/bson/bson-inl.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bson.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bson_builder_base.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bson_db.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bson_field.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bson_validate.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bsonmisc.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bsonobj.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bsonobjbuilder.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bsonobjiterator.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bsontypes.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/inline_decls.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/oid.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/ordering.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/bson/bsonelement.h $(PREFIX)/include/mongo/bson/
	$(INSTALL) -m 644 ./src/mongo/shell/linenoise.h $(PREFIX)/include/mongo/shell/
	$(INSTALL) -m 644 ./src/mongo/shell/linenoise_utf8.h $(PREFIX)/include/mongo/shell/
	$(INSTALL) -m 644 ./src/mongo/shell/mk_wcwidth.h $(PREFIX)/include/mongo/shell/
	$(INSTALL) -m 644 ./src/mongo/shell/shell_utils.h $(PREFIX)/include/mongo/shell/
	$(INSTALL) -m 644 ./src/mongo/shell/shell_utils_extended.h $(PREFIX)/include/mongo/shell/
	$(INSTALL) -m 644 ./src/mongo/shell/shell_utils_launcher.h $(PREFIX)/include/mongo/shell/
	$(INSTALL) -m 644 ./src/mongo/s/chunk_diff.hpp $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/balancer_policy.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/chunk.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/chunk_diff.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/chunk_version.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/client_info.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/cluster_client_internal.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/collection_manager.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/config.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/config_upgrade.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/config_upgrade_helpers.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/cursors.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/d_chunk_manager.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/d_logic.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/d_writeback.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/field_parser-inl.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/field_parser.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/grid.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/interrupt_status_mongos.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/metadata_loader.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/mongo_version_range.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/request.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/server.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/shard.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/shardkey.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/stale_exception.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/strategy.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_changelog.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_chunk.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_collection.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_config_version.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_database.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_lockpings.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_locks.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_mongos.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_settings.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_shard.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/type_tags.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/version_manager.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/balance.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/s/writeback_listener.h $(PREFIX)/include/mongo/s/
	$(INSTALL) -m 644 ./src/mongo/scripting/v8_utils.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/scripting/bson_template_evaluator.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/scripting/engine.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/scripting/engine_spidermonkey.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/scripting/engine_spidermonkey_internal.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/scripting/engine_v8.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/scripting/v8_db.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/scripting/v8_deadline_monitor.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/scripting/v8_profiler.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/scripting/bench.h $(PREFIX)/include/mongo/scripting/
	$(INSTALL) -m 644 ./src/mongo/platform/windows_basic.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/atomic_intrinsics.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/atomic_intrinsics_gcc.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/atomic_intrinsics_win32.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/atomic_word.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/basic.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/bits.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/compiler.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/compiler_gcc.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/compiler_msvc.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/cstdint.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/float_utils.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/random.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/strtoll.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/unordered_map.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/platform/unordered_set.h $(PREFIX)/include/mongo/platform/
	$(INSTALL) -m 644 ./src/mongo/base/error_codes.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/configuration_variable_manager.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/counter.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/disallow_copying.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/global_initializer.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/global_initializer_registerer.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/init.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/initializer.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/initializer_context.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/initializer_dependency_graph.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/initializer_function.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/make_string_vector.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/owned_pointer_map.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/owned_pointer_vector.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/parse_number.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/status.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/string_data-inl.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/base/string_data.h $(PREFIX)/include/mongo/base/
	$(INSTALL) -m 644 ./src/mongo/util/net/ssl_manager.h $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 644 ./src/mongo/util/net/hostandport.h $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 644 ./src/mongo/util/net/httpclient.h $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 644 ./src/mongo/util/net/listen.h $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 644 ./src/mongo/util/net/message.h $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 644 ./src/mongo/util/net/message_port.h $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 644 ./src/mongo/util/net/message_server.h $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 644 ./src/mongo/util/net/miniwebserver.h $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 644 ./src/mongo/util/net/sock.h $(PREFIX)/include/mongo/util/net/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/shared_mutex_win.hpp $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/list.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/mapsf.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/msg.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/mutex.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/mutexdebugger.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/mvar.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/qlock.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/race.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/rwlock.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/rwlockimpl.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/simplerwlock.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/spin_lock.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/synchronization.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/task.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/thread_pool.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/threadlocal.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/value.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/concurrency/ticketholder.h $(PREFIX)/include/mongo/util/concurrency/
	$(INSTALL) -m 644 ./src/mongo/util/mongoutils/checksum.h $(PREFIX)/include/mongo/util/mongoutils/
	$(INSTALL) -m 644 ./src/mongo/util/mongoutils/hash.h $(PREFIX)/include/mongo/util/mongoutils/
	$(INSTALL) -m 644 ./src/mongo/util/mongoutils/html.h $(PREFIX)/include/mongo/util/mongoutils/
	$(INSTALL) -m 644 ./src/mongo/util/mongoutils/str.h $(PREFIX)/include/mongo/util/mongoutils/
	$(INSTALL) -m 644 ./src/mongo/util/admin_access.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/alignedbuilder.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/allocator.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/array.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/assert_util.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/background.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/base64.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/bson_util.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/bufreader.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/file.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/checksum.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/compress.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/debug_util.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/descriptive_stats-inl.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/descriptive_stats.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/elapsed_tracker.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/embedded_builder.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/exception_filter_win32.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/exit_code.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/fail_point.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/fail_point_registry.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/fail_point_service.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/file_allocator.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/goodies.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/hashtab.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/heapcheck.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/hex.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/histogram.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/intrusive_counter.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/log.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/logfile.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/lruishmap.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/map_util.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/md5.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/mmap.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/moveablebuffer.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/ntservice.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/optime.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/password.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/paths.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/processinfo.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/progress_meter.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/queue.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/ramlog.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/safe_num.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/scopeguard.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/sequence_util.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/signal_handlers.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/stack_introspect.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/stacktrace.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/startup_test.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/string_map.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/string_map_internal.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/text.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/string_writer.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/stringutils.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/systeminfo.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/timer-generic-inl.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/timer-inl.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/timer-posixclock-inl.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/timer-win32-inl.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/timer.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/touch_pages.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/trace.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/unordered_fast_key_table.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/unordered_fast_key_table_internal.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/version.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/winutil.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/md5.hpp $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/util/time_support.h $(PREFIX)/include/mongo/util/
	$(INSTALL) -m 644 ./src/mongo/pch.h $(PREFIX)/include/mongo/
	$(INSTALL) -m 644 ./src/mongo/server.h $(PREFIX)/include/mongo/
	$(INSTALL) -m 644 ./src/mongo/targetver.h $(PREFIX)/include/mongo/
	$(INSTALL) -m 644 ./src/third_party/murmurhash3/MurmurHash3.h $(PREFIX)/include/mongo/third_party/murmurhash3/
