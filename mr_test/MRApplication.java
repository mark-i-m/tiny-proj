
import java.io.IOException;
import java.util.*;

import org.apache.hadoop.conf.*;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.mapreduce.lib.input.*;
import org.apache.hadoop.mapreduce.lib.output.*;
import org.apache.hadoop.util.*;

public class MRApplication {

    // How much to amplify the input. For each value of input, there is this
    // many values output by the mapper. So given a 1M line input, AMP = 2^10
    // yields about a 8GB (2^10 * 1M * 8B) because a long is 8B.
    private static final long AMP = 1 << 0;
    
    public static class TestMapper
        extends Mapper<LongWritable, Text, IntWritable, IntWritable>
    {
        private Random rng = new Random();
        private static final int N = Integer.MAX_VALUE;

        protected void map(LongWritable key, Text value, Context context)
            throws IOException, InterruptedException
        {
            Configuration conf = context.getConfiguration();
            int numReducers = Integer.parseInt(conf.get("numReducers"));
            for (long i = 0; i < AMP; i++) {
                int val = rng.nextInt(N) % numReducers;
                context.write(new IntWritable(val), new IntWritable(val));
            }
        }
    }

    public static class TestReducer
        extends Reducer<IntWritable, IntWritable, NullWritable, NullWritable>
    {
        protected void reduce(IntWritable key, Iterable<IntWritable> values, Context context)
            throws IOException, InterruptedException
        { 
            // only output the values
            for (IntWritable v : values)
                context.write(NullWritable.get(), NullWritable.get());
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        conf.set("numReducers", args[2]);
        Job job = Job.getInstance(conf, "test");

        job.setJarByClass(MRApplication.class);

        job.setMapperClass(TestMapper.class);
        job.setReducerClass(TestReducer.class);

        job.setNumReduceTasks(Integer.parseInt(args[2]));

        job.setMapOutputKeyClass(IntWritable.class);
        job.setMapOutputValueClass(IntWritable.class);

        job.setOutputKeyClass(NullWritable.class);
        job.setOutputValueClass(NullWritable.class);

        job.setInputFormatClass(TextInputFormat.class);
        job.setOutputFormatClass(TextOutputFormat.class);

        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
