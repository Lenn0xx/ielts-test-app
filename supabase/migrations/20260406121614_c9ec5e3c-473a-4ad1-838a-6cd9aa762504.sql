ALTER TABLE public.exam_results ADD COLUMN wrong_answers jsonb DEFAULT '[]'::jsonb;

CREATE POLICY "Users can update their own results"
ON public.exam_results
FOR UPDATE
TO public
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);