#ifndef COMPAT_SYSLOG_H
#define COMPAT_SYSLOG_H

#ifdef __unix__
#  include <sys/syslog.h>
#endif
#ifdef _WIN32
#  include <stdio.h>
#  include <stdarg.h>
#endif

#if defined(_WIN32)
static __attribute__((unused))
void openlog(const char *_ident, int _logopt, int _facility) {}
#endif

#if defined(_WIN32)
#define LOG_PID         0x01    /* log the pid with each message */
#define LOG_CONS        0x02    /* log on the console if errors in sending */
#define LOG_ODELAY      0x04    /* delay open until first syslog() (default) */
#define LOG_NDELAY      0x08    /* don't delay open */
#define LOG_NOWAIT      0x10    /* don't wait for console forks: DEPRECATED */
#define LOG_PERROR      0x20    /* log to stderr as well */
#define LOG_KERN        (0<<3)  /* kernel messages */
#define LOG_USER        (1<<3)  /* random user-level messages */
#define LOG_MAIL        (2<<3)  /* mail system */
#define LOG_DAEMON      (3<<3)  /* system daemons */
#define LOG_AUTH        (4<<3)  /* security/authorization messages */
#define LOG_SYSLOG      (5<<3)  /* messages generated internally by syslogd */
#define LOG_LPR         (6<<3)  /* line printer subsystem */
#define LOG_NEWS        (7<<3)  /* network news subsystem */
#define LOG_UUCP        (8<<3)  /* UUCP subsystem */
#define LOG_CRON        (9<<3)  /* clock daemon */
#define LOG_AUTHPRIV    (10<<3) /* security/authorization messages (private) */
#define LOG_FTP         (11<<3) /* ftp daemon */
#define LOG_EMERG       0       /* system is unusable */
#define LOG_ALERT       1       /* action must be taken immediately */
#define LOG_CRIT        2       /* critical conditions */
#define LOG_ERR         3       /* error conditions */
#define LOG_WARNING     4       /* warning conditions */
#define LOG_NOTICE      5       /* normal but significant condition */
#define LOG_INFO        6       /* informational */
#define LOG_DEBUG       7       /* debug-level messages */
static __attribute__((unused))
void syslog(int _pri, char const _fmt[], ...)  {
    va_list va;
    switch (_pri) {
    case LOG_EMERG:   fputs("EMERGENCY: ", stderr); break;
    case LOG_ALERT:   fputs("ALERT: "    , stderr); break;
    case LOG_CRIT:    fputs("CRITICAL: " , stderr); break;
    case LOG_ERR:     fputs("ERROR: "    , stderr); break;
    case LOG_WARNING: fputs("WARNING: "  , stderr); break;
    case LOG_NOTICE:  fputs("NOTICE: "   , stderr); break;
    case LOG_INFO:    fputs("INFO: "     , stderr); break;
    case LOG_DEBUG:   fputs("DEBUG: "    , stderr); break;
    }
    va_start(va, _fmt);
    vfprintf(stderr, _fmt, va);
    va_end(va);
    fputc('\n', stderr);
    fflush(stderr);
}
#endif





#endif
