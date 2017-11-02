
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
    
    public static class TestMapper
        extends Mapper<LongWritable, Text, IntWritable, Text>
    {
        private Random rng = new Random();
        private static final int N = Integer.MAX_VALUE;

        protected void map(LongWritable key, Text value, Context context)
            throws IOException, InterruptedException
        {
            context.write(new IntWritable(rng.nextInt(N)), value);
        }
    }

    public static class TestReducer
        extends Reducer<IntWritable, Text, NullWritable, Text>
    {
        protected void reduce(IntWritable key, Iterable<Text> values, Context context)
            throws IOException, InterruptedException
        { 
            for (Text text : values) {
                // only output the values
                context.write(NullWritable.get(), text);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "test");

        job.setJarByClass(MRApplication.class);

        job.setMapperClass(TestMapper.class);
        job.setReducerClass(TestReducer.class);

        job.setNumReduceTasks(Integer.parseInt(args[2]));

        job.setMapOutputKeyClass(IntWritable.class);
        job.setMapOutputValueClass(Text.class);

        job.setOutputKeyClass(NullWritable.class);
        job.setOutputValueClass(Text.class);

        job.setInputFormatClass(TextInputFormat.class);
        job.setOutputFormatClass(TextOutputFormat.class);

        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
